import { Component, OnInit, Input } from '@angular/core';
import icMoreVert from '@iconify/icons-ic/twotone-more-vert';
import icAdd from '@iconify/icons-ic/baseline-add';
import icEdit from '@iconify/icons-ic/twotone-edit';
import icDelete from '@iconify/icons-ic/twotone-delete';
import icSearch from '@iconify/icons-ic/search';
import icFilterList from '@iconify/icons-ic/filter-list';
import icImpersonate from '@iconify/icons-ic/twotone-account-circle';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router} from '@angular/router';
import { fadeInUp400ms } from '../../../../@vex/animations/fade-in-up.animation';
import { stagger40ms } from '../../../../@vex/animations/stagger.animation';
import { TranslateService } from '@ngx-translate/core';
import { EditMaleToiletTypeComponent } from './edit-male-toilet-type/edit-male-toilet-type.component';

@Component({
  selector: 'vex-male-toilet-type',
  templateUrl: './male-toilet-type.component.html',
  styleUrls: ['./male-toilet-type.component.scss'],
  animations: [
    fadeInUp400ms,
    stagger40ms
  ]
})
export class MaleToiletTypeComponent implements OnInit {
  @Input()
  columns = [
    { label: 'Title', property: 'title', type: 'text', visible: true },
    { label: 'Sort Order', property: 'sort_order', type: 'number', visible: true },
    { label: 'Actions', property: 'actions', type: 'text', visible: true }
  ];

  FemaleToiletTypeModelList;

  icMoreVert = icMoreVert;
  icAdd = icAdd;
  icEdit = icEdit;
  icDelete = icDelete;
  icSearch = icSearch;
  icImpersonate = icImpersonate;
  icFilterList = icFilterList;
  loading:Boolean;

  constructor(private router: Router,private dialog: MatDialog,public translateService:TranslateService) {
    translateService.use('en');
    this.FemaleToiletTypeModelList = [
      {title: 'Single-Flush Toilet', sort_order: 1},
      {title: 'Double-Flush Toilet', sort_order: 2},
      {title: 'No-Touch Flush Toilet', sort_order: 3},
    ]
  }

  ngOnInit(): void {
  }

  getPageEvent(event){    
    // this.getAllSchool.pageNumber=event.pageIndex+1;
    // this.getAllSchool.pageSize=event.pageSize;
    // this.callAllSchool(this.getAllSchool);
  }

  goToAdd(){
    this.dialog.open(EditMaleToiletTypeComponent, {
      width: '500px'
    })
  }

  toggleColumnVisibility(column, event) {
    event.stopPropagation();
    event.stopImmediatePropagation();
    column.visible = !column.visible;
  }

  get visibleColumns() {
    return this.columns.filter(column => column.visible).map(column => column.property);
  }

}
