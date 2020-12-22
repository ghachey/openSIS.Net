import { ChangeDetectionStrategy, ChangeDetectorRef, Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { Subject, Subscription } from 'rxjs';
import { fadeInRight400ms } from '../../../../@vex/animations/fade-in-right.animation';
import { MatSnackBar } from '@angular/material/snack-bar';
import { LayoutService } from 'src/@vex/services/layout.service';
import { stagger60ms } from '../../../../@vex/animations/stagger.animation';
import { fadeInUp400ms } from '../../../../@vex/animations/fade-in-up.animation';
import icGeneralInfo from '@iconify/icons-ic/outline-account-circle';
import icSchoolInfo from '@iconify/icons-ic/outline-corporate-fare';
import icLoginInfo from '@iconify/icons-ic/outline-lock-open';
import icAddressInfo from '@iconify/icons-ic/outline-location-on';
import icCertificationInfo from '@iconify/icons-ic/outline-military-tech';
import icSchedule from '@iconify/icons-ic/outline-schedule';
import { ImageCropperService } from '../../../services/image-cropper.service';
import { TranslateService } from '@ngx-translate/core';
import { SchoolCreate } from '../../../../../src/app/enums/school-create.enum';
import { StaffAddModel } from '../../../models/staffModel';
import { StaffService } from '../../../services/staff.service';
import { FieldsCategoryListView } from '../../../models/fieldsCategoryModel';
import { CustomFieldService } from '../../../services/custom-field.service';
import { takeUntil } from 'rxjs/operators';
import { LoaderService } from '../../../services/loader.service';

@Component({
  changeDetection: ChangeDetectionStrategy.OnPush,
  selector: 'vex-add-staff',
  templateUrl: './add-staff.component.html',
  styleUrls: ['./add-staff.component.scss'],
  animations: [
    fadeInRight400ms,
    stagger60ms,
    fadeInUp400ms
  ]
})
export class AddStaffComponent implements OnInit, OnDestroy {
  destroySubject$: Subject<void> = new Subject();
  staffCreate = SchoolCreate;
  @Input() staffCreateMode: SchoolCreate;
  staffAddModel: StaffAddModel = new StaffAddModel();
  staffId: number;
  fieldsCategory = [];
  fieldsCategoryListView = new FieldsCategoryListView();
  currentCategory: number = 12; // because 12 is the id of general info.
  indexOfCategory: number = 0;
  staffTitle = "Add Staff Information";
  pageStatus = "Add Staff"
  module = 'Staff';
  responseImage: string;
  enableCropTool = true;
  icGeneralInfo = icGeneralInfo;
  icSchoolInfo = icSchoolInfo;
  icLoginInfo = icLoginInfo;
  icAddressInfo = icAddressInfo;
  icCertificationInfo = icCertificationInfo;
  icSchedule = icSchedule;
  loading: boolean;

  pageId = 'General Info';

  constructor(private layoutService: LayoutService, public translateService: TranslateService,
    private staffService: StaffService,
    private customFieldService: CustomFieldService,
    private snackbar: MatSnackBar,
    private loaderService:LoaderService,
    private cdr: ChangeDetectorRef) {
    translateService.use('en');
    this.layoutService.collapseSidenav();
    this.staffService.categoryToSend.pipe(takeUntil(this.destroySubject$)).subscribe((res:number) => {
      this.currentCategory = res;
    });
    this.loaderService.isLoading.pipe(takeUntil(this.destroySubject$)).subscribe((currentState) => {
      this.loading = currentState;
    });
  }

  ngOnInit(): void {
    this.staffCreateMode = this.staffCreate.ADD;
    this.staffId = this.staffService.getStaffId();
    if (this.staffId != null || this.staffId != undefined) {
      this.staffCreateMode = this.staffCreate.VIEW;
      this.getStaffDetailsUsingId();
      this.onViewMode();
    } else if (this.staffCreateMode == this.staffCreate.ADD) {
      this.getAllFieldsCategory();
    }
  }
  ngAfterViewChecked(){
    this.cdr.detectChanges();
 }
  onViewMode() {
    //this.staffService.setStaffImage(this.responseImage);
    this.pageStatus = "View Staff"
  }

  changeCategory(field, index) {
    let staffDetails = this.staffService.getStaffDetails();
    if (staffDetails != undefined || staffDetails != null) {
      this.staffCreateMode = this.staffCreate.EDIT;
      this.currentCategory = field.categoryId;
      this.indexOfCategory = index;
      this.staffAddModel = staffDetails;
    }

    if (this.staffCreateMode == this.staffCreate.VIEW) {
      this.currentCategory = field.categoryId;
      this.indexOfCategory = index;
      this.pageStatus = "View Staff"
    }
  }

  showPage(pageId) {
    localStorage.setItem("pageId", pageId);
    this.pageId = localStorage.getItem("pageId");
    //this.disableSection();
  }

  getStaffDetailsUsingId() {
    this.staffAddModel.staffMaster.staffId = this.staffId;
    this.staffService.viewStaff(this.staffAddModel).subscribe(data => {
      this.staffAddModel = data;
      this.fieldsCategory = data.fieldsCategoryList;
      this.staffService.sendDetails(this.staffAddModel);
      //this.responseImage = this.staffAddModel.staffMaster.staffPhoto;
      this.staffTitle = this.staffAddModel.staffMaster.firstGivenName + " " + this.staffAddModel.staffMaster.lastFamilyName;
      //this.staffService.setStaffImage(this.responseImage);
    });
  }

  getAllFieldsCategory() {
    this.fieldsCategoryListView.module = "Staff";
    this.fieldsCategoryListView.schoolId = +sessionStorage.getItem('selectedSchoolId');
    this.customFieldService.getAllFieldsCategory(this.fieldsCategoryListView).subscribe((res) => {
      if (typeof (res) == 'undefined') {
        this.snackbar.open('Category list failed. ' + sessionStorage.getItem("httpError"), '', {
          duration: 10000
        });
      }
      else {
        if (res._failure) {
          this.snackbar.open('Cateogy list failed. ' + res._message, 'LOL THANKS', {
            duration: 10000
          });
        }
        else {
          this.fieldsCategory = res.fieldsCategoryList.filter(x => x.isSystemCategory == true);
        }
      }
    }
    );
  }

  ngOnDestroy() {
    this.staffService.setStaffDetails(null);
    // this.staffService.setStudentImage(null);
    this.staffService.setStaffId(null);
    this.destroySubject$.next();
  }

}
