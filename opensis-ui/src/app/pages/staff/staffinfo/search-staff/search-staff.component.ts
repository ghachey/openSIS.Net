import { Component, OnInit, ViewChild, Output, EventEmitter, OnDestroy } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatAccordion } from '@angular/material/expansion';
import { StudentService } from '../../../../services/student.service';
import { filterParams, StudentListModel, StudentMasterSearchModel } from '../../../../models/studentModel';
import { GetAllSectionModel } from '../../../../models/sectionModel';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { CommonLOV } from '../../../shared-module/lov/common-lov';
import { SectionService } from '../../../../services/section.service';
import { CommonService } from '../../../../services/common.service';
import { LoginService } from '../../../../services/login.service';
import { CountryModel } from '../../../../models/countryModel';
import { LanguageModel } from '../../../../models/languageModel';
import { MatSnackBar } from '@angular/material/snack-bar';
import { StaffService } from '../../../../services/staff.service';
import { GetAllStaffModel, StaffMasterSearchModel } from '../../../../models/staffModel';
import { Profile } from '../../../../enums/opensis-profile.enum';

@Component({
  selector: 'vex-search-staff',
  templateUrl: './search-staff.component.html',
  styleUrls: ['./search-staff.component.scss']
})
export class SearchStaffComponent implements OnInit,OnDestroy {

  @ViewChild(MatAccordion) accordion: MatAccordion;
  @Output() showHideAdvanceSearch = new EventEmitter<boolean>();
  @Output() searchList = new EventEmitter<any>();
  countryModel: CountryModel = new CountryModel();
  languages: LanguageModel = new LanguageModel();
  @ViewChild('f') currentForm: NgForm;
  destroySubject$: Subject<void> = new Subject();
  staffMasterSearchModel: StaffMasterSearchModel = new StaffMasterSearchModel();
  getAllStaff: GetAllStaffModel = new GetAllStaffModel();
    dobEndDate : string;
  dobStartDate : string;
  params = [];
  countryListArr = [];
  ethnicityList = [];
  raceList = [];
  genderList = [];
  suffixList = [];
  maritalStatusList = [];
  salutationList = [];
  sectionList = [];
  languageList;
  profiles=Object.keys(Profile);
  constructor(
    private commonLOV: CommonLOV,
    private snackbar: MatSnackBar,
    private sectionService: SectionService,
    private commonService: CommonService,
    private loginService: LoginService,
    private staffService: StaffService
  ) { }

  ngOnInit(): void {
    this.initializeDropdownsInAddMode();
  }

  initializeDropdownsInAddMode() {
    this.callLOVs();
    this.getAllCountry();
    this.GetAllLanguage();
    this.getAllSection();
  }

  callLOVs() {
    this.commonLOV.getLovByName('Salutation').pipe(takeUntil(this.destroySubject$)).subscribe((res) => {
      this.salutationList = res;
    });
    this.commonLOV.getLovByName('Suffix').pipe(takeUntil(this.destroySubject$)).subscribe((res) => {
      this.suffixList = res;
    });
    this.commonLOV.getLovByName('Gender').pipe(takeUntil(this.destroySubject$)).subscribe((res) => {
      this.genderList = res;
    });
    this.commonLOV.getLovByName('Race').pipe(takeUntil(this.destroySubject$)).subscribe((res) => {
      this.raceList = res;
    });
    this.commonLOV.getLovByName('Ethnicity').pipe(takeUntil(this.destroySubject$)).subscribe((res) => {
      this.ethnicityList = res;
    });
    this.commonLOV.getLovByName('Marital Status').pipe(takeUntil(this.destroySubject$)).subscribe((res) => {
      this.maritalStatusList = res;
    });
  }

  getAllCountry() {
    this.commonService.GetAllCountry(this.countryModel).pipe(takeUntil(this.destroySubject$)).subscribe(data => {
      if (typeof (data) === 'undefined') {
        this.countryListArr = [];
      }
      else {
        if (data._failure) {
          this.countryListArr = [];
        } else {
          this.countryListArr = data.tableCountry?.sort((a, b) => { return a.name < b.name ? -1 : 1; })

        }
      }
    })
  }

  GetAllLanguage() {
    this.languages._tenantName = sessionStorage.getItem('tenant');
    this.loginService.getAllLanguage(this.languages).pipe(takeUntil(this.destroySubject$)).subscribe((res) => {
      if (typeof (res) === 'undefined') {
        this.languageList = [];
      }
      else {
        this.languageList = res.tableLanguage?.sort((a, b) => { return a.locale < b.locale ? -1 : 1; })

      }
    });
  }

  getAllSection() {
    let section: GetAllSectionModel = new GetAllSectionModel();
    this.sectionService.GetAllSection(section).pipe(takeUntil(this.destroySubject$)).subscribe(data => {
      if (data._failure) {
      }
      else {
        this.sectionList = data.tableSectionsList;
      }

    });
  }


  submit() {
    this.params = [];
    for (var key in this.staffMasterSearchModel) {
      if (this.staffMasterSearchModel.hasOwnProperty(key))
        if (this.staffMasterSearchModel[key] !== null) {
          this.params.push({ "columnName": key, "filterOption": 11, "filterValue": this.staffMasterSearchModel[key] })
        }
    }
    
    this.getAllStaff.filterParams = this.params;
    this.getAllStaff.sortingModel = null;
    this.getAllStaff.dobStartDate = this.dobStartDate;
    this.getAllStaff.dobEndDate= this.dobEndDate;

    this.staffService.getAllStaffList(this.getAllStaff).subscribe(res => {
      if (res._failure) {
        this.searchList.emit([]);
        this.snackbar.open(res._message, '', {
          duration: 10000
        });
      } else {
        this.searchList.emit(res);
        this.showHideAdvanceSearch.emit(false);
      }
    });
  }

  resetData() {
    this.currentForm.reset();
  }

  hideAdvanceSearch() {
    this.showHideAdvanceSearch.emit(false);
  }

  ngOnDestroy() {
    this.destroySubject$.next();
    this.destroySubject$.complete();
  }

}
