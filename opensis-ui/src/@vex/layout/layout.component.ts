import { AfterViewInit, ChangeDetectorRef, Component, Inject, Input, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { BreakpointObserver } from '@angular/cdk/layout';
import { LayoutService } from '../services/layout.service';
import { UntilDestroy, untilDestroyed } from '@ngneat/until-destroy';
import { MatSidenav, MatSidenavContainer } from '@angular/material/sidenav';
import { Event, NavigationEnd, Router, Scroll } from '@angular/router';
import { filter, map, startWith, withLatestFrom } from 'rxjs/operators';
import { checkRouterChildsData } from '../utils/check-router-childs-data';
import { DOCUMENT } from '@angular/common';
import { ConfigService } from '../services/config.service';
import * as jwt_decode from 'jwt-decode';
import { MatDialog } from '@angular/material/dialog';
import { SessionExpireAlertComponent } from './session-expire/session-expire-alert/session-expire-alert.component';
import { DefaultValuesService } from '../../app/common/default-values.service';
import { timer } from 'rxjs';

@UntilDestroy()
@Component({
  selector: 'vex-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.scss']
})
export class LayoutComponent implements OnInit, AfterViewInit {

  @Input() sidenavRef: TemplateRef<any>;
  @Input() toolbarRef: TemplateRef<any>;
  @Input() footerRef: TemplateRef<any>;
  @Input() quickpanelRef: TemplateRef<any>;

  isLayoutVertical$ = this.configService.config$.pipe(map(config => config.layout === 'vertical'));
  isBoxed$ = this.configService.config$.pipe(map(config => config.boxed));
  isToolbarFixed$ = this.configService.config$.pipe(map(config => config.toolbar.fixed));
  isFooterFixed$ = this.configService.config$.pipe(map(config => config.footer.fixed));
  isFooterVisible$ = this.configService.config$.pipe(map(config => config.footer.visible));
  sidenavCollapsed$ = this.layoutService.sidenavCollapsed$;
  isDesktop$ = this.layoutService.isDesktop$;

  scrollDisabled$ = this.router.events.pipe(
    filter(event => event instanceof NavigationEnd),
    startWith(null),
    map(() => checkRouterChildsData(this.router.routerState.root.snapshot, data => data.scrollDisabled))
  );

  containerEnabled$ = this.router.events.pipe(
    filter(event => event instanceof NavigationEnd),
    startWith(null),
    map(() => checkRouterChildsData(this.router.routerState.root.snapshot, data => data.containerEnabled))
  );

  searchOpen$ = this.layoutService.searchOpen$;

  @ViewChild('quickpanel', { static: true }) quickpanel: MatSidenav;
  @ViewChild('sidenav', { static: true }) sidenav: MatSidenav;
  @ViewChild(MatSidenavContainer, { static: true }) sidenavContainer: MatSidenavContainer;

  constructor(private cd: ChangeDetectorRef,
              private breakpointObserver: BreakpointObserver,
              private layoutService: LayoutService,
              private configService: ConfigService,
              private router: Router,
              private defaultValueService:DefaultValuesService,
              @Inject(DOCUMENT) private document: Document,
              private dialog: MatDialog) { }

  ngOnInit() {
    /**
     * Expand Sidenav when we switch from mobile to desktop view
     */
    this.isDesktop$.pipe(
      filter(matches => !matches),
      untilDestroyed(this)
    ).subscribe(() => this.layoutService.expandSidenav());

    /**
     * Open/Close Quickpanel through LayoutService
     */
    this.layoutService.quickpanelOpen$.pipe(
      untilDestroyed(this)
    ).subscribe(open => open ? this.quickpanel.open() : this.quickpanel.close());

    /**
     * Open/Close Sidenav through LayoutService
     */
    this.layoutService.sidenavOpen$.pipe(
      untilDestroyed(this)
    ).subscribe(open => open ? this.sidenav.open() : this.sidenav.close());

    /**
     * Mobile only:
     * Close Sidenav after Navigating somewhere (e.g. when a user clicks a link in the Sidenav)
     */
    this.router.events.pipe(
      filter(event => event instanceof NavigationEnd),
      withLatestFrom(this.isDesktop$),
      filter(([event, matches]) => !matches),
      untilDestroyed(this)
    ).subscribe(() => this.sidenav.close());

    this.checkToken();
  }

  ngAfterViewInit(): void {
    /**
     * Enable Scrolling to specific parts of the page using the Router
     */
    this.router.events.pipe(
      filter<Event, Scroll>((e: Event): e is Scroll => e instanceof Scroll),
      untilDestroyed(this)
    ).subscribe(e => {
      if (e.position) {
        // backward navigation
        this.sidenavContainer.scrollable.scrollTo({
          start: e.position[0],
          top: e.position[1]
        });
      } else if (e.anchor) {
        // anchor navigation

        const scroll = (anchor: HTMLElement) => this.sidenavContainer.scrollable.scrollTo({
          behavior: 'smooth',
          top: anchor.offsetTop,
          left: anchor.offsetLeft
        });

        let anchorElem = this.document.getElementById(e.anchor);

        if (anchorElem) {
          scroll(anchorElem);
        } else {
          setTimeout(() => {
            anchorElem = this.document.getElementById(e.anchor);
            scroll(anchorElem);
          }, 100);
        }
      } else {
        // forward navigation
        this.sidenavContainer.scrollable.scrollTo({
          top: 0,
          start: 0
        });
      }
    });
  }

  clearStorage(){
    localStorage.clear();
    let schoolId = this.defaultValueService.getSchoolID()
    sessionStorage.clear();
    if(schoolId){
      this.defaultValueService.setSchoolID(JSON.stringify(schoolId))
    }
    sessionStorage.setItem('tenant',this.defaultValueService.getDefaultTenant());
    let a =sessionStorage.setItem('tenant',this.defaultValueService.getDefaultTenant());
    console.log(a);
  }

  checkToken() { 
    let decoded = JSON.parse(JSON.stringify(jwt_decode.default(sessionStorage.getItem('token'))));
    let date1:any = new Date(decoded.exp*1000)
    let date2:any = new Date();
    let res = Math.abs(date1 - date2) / 1000;
    let minutes = Math.floor(res / 60) % 60;
    let tokenEndTime=(minutes-2)*60*1000;
    const tokenExpired = Date.now() > (decoded.exp * 1000-120000);

    if (!tokenExpired) {
      const source = timer(tokenEndTime);
      source.subscribe(()=>{
        if(this.router.url != '/'){
          this.dialog.open(SessionExpireAlertComponent, {
            maxWidth: '600px',
            disableClose:true
          }).afterClosed().subscribe(token => {
            if (token){
              this.defaultValueService.setToken(token)
              this.checkToken();
              return;
            }
             this.clearStorage();
             this.dialog.closeAll();
             this.router.navigateByUrl('/');
         });
        }
      });
    } else {
      this.clearStorage();
      this.dialog.closeAll();
      this.router.navigateByUrl('/');
    }
  }
}
