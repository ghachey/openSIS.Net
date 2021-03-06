import { Component, OnInit, ViewChild, Output, EventEmitter, OnDestroy, Input } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatAccordion } from '@angular/material/expansion';
import { StudentService } from '../../../../services/student.service';
import { filterParams, StudentListModel, StudentMasterSearchModel } from '../../../../models/student.model';
import { GetAllSectionModel } from '../../../../models/section.model';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { CommonLOV } from '../../../shared-module/lov/common-lov';
import { SectionService } from '../../../../services/section.service';
import { CommonService } from '../../../../services/common.service';
import { LoginService } from '../../../../services/login.service';
import { CountryModel } from '../../../../models/country.model';
import { LanguageModel } from '../../../../models/language.model';
import { MatSnackBar } from '@angular/material/snack-bar';
import { SearchFilterAddViewModel } from '../../../../models/search-filter.model';

import { SharedFunction } from '../../../shared/shared-function';
import { DefaultValuesService } from '../../../../common/default-values.service';
@Component({
  selector: 'vex-search-student',
  templateUrl: './search-student.component.html',
  styleUrls: ['./search-student.component.scss']
})
export class SearchStudentComponent implements OnInit, OnDestroy {

  @ViewChild(MatAccordion) accordion: MatAccordion;
  @Output() showHideAdvanceSearch = new EventEmitter<any>();
  @Output() searchList = new EventEmitter<any>();
  @Output() searchValue = new EventEmitter<any>();
  @Output() toggelValues = new EventEmitter<any>();
  @Input() filterJsonParams;
  @Input() incomingSearchValue;
  @Input() incomingToggleValues;
  countryModel: CountryModel = new CountryModel();
  languages: LanguageModel = new LanguageModel();
  @ViewChild('f') currentForm: NgForm;
  destroySubject$: Subject<void> = new Subject();
  studentMasterSearchModel: StudentMasterSearchModel = new StudentMasterSearchModel();
  getAllStudent: StudentListModel = new StudentListModel();
  searchFilterAddViewModel: SearchFilterAddViewModel= new SearchFilterAddViewModel();
  dobEndDate: string;
  dobStartDate: string;
  showSaveFilter= true;
  params = [];
  searchTitle :string= 'search';
  updateFilter: boolean = false;
  countryListArr = [];
  ethnicityList = [];
  raceList = [];
  genderList = [];
  suffixList = [];
  maritalStatusList = [];
  salutationList = [];
  sectionList = [];
  languageList;
  searchSchoolId: number = this.defaultValuesService.getSchoolID();
  inactiveStudents = false;
  constructor(
    private studentService: StudentService,
    private commonLOV: CommonLOV,
    private snackbar: MatSnackBar,
    private sectionService: SectionService,
    private commonService: CommonService,
    private defaultValuesService: DefaultValuesService,
    private loginService: LoginService,
    private commonFunction: SharedFunction,
  ) { }

  ngOnInit(): void {
    if (this.incomingSearchValue){
      this.inactiveStudents = this.incomingToggleValues.inactiveStudents;
      this.searchSchoolId = this.incomingToggleValues.searchSchoolId;
      this.studentMasterSearchModel = this.incomingSearchValue;
    }
    if (this.filterJsonParams !== null && this.filterJsonParams !== undefined) {
      this.updateFilter = true;
      this.searchTitle='searchAndUpdateFilter';
      let jsonResponse = JSON.parse(this.filterJsonParams.jsonList);
      for (let json of jsonResponse) {
        this.studentMasterSearchModel[json.columnName] = json.filterValue;
      }
    }

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
      if (typeof (data) == 'undefined') {
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
    this.loginService.getAllLanguage(this.languages).pipe(takeUntil(this.destroySubject$)).subscribe((res) => {
      if (typeof (res) == 'undefined') {
        this.languageList = [];
      }
      else {
        this.languageList = res.tableLanguage?.sort((a, b) => { return a.locale < b.locale ? -1 : 1; })

      }
    });
  }
  searchAllSchools(event){
    if (event.checked){
      this.searchSchoolId = 0;
    }
    else{
      this.searchSchoolId = this.defaultValuesService.getSchoolID();
    }
  }
  includeInactiveStudents(event){
    if (event.checked){
      this.inactiveStudents = true;
    }
    else{
      this.inactiveStudents = false;
    }
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
    for (let key in this.studentMasterSearchModel) {
      if (this.studentMasterSearchModel.hasOwnProperty(key))
      if (this.studentMasterSearchModel[key] !== null && this.studentMasterSearchModel[key] !== '' && this.studentMasterSearchModel[key] !== undefined) {
        if (key === 'dob') {
          this.params.push({ "columnName": key, "filterOption": 11, "filterValue": this.commonFunction.formatDateSaveWithoutTime(this.studentMasterSearchModel[key]) })
        }
        else {
          this.params.push({ "columnName": key, "filterOption": 11, "filterValue": this.studentMasterSearchModel[key] })
        }
      }
    }



    if (this.updateFilter) {
      this.showSaveFilter = false;
      this.searchFilterAddViewModel.searchFilter.filterId = this.filterJsonParams.filterId;
      this.searchFilterAddViewModel.searchFilter.module = 'Student';
      this.searchFilterAddViewModel.searchFilter.jsonList = JSON.stringify(this.params);
      this.searchFilterAddViewModel.searchFilter.filterName = this.filterJsonParams.filterName;
      this.searchFilterAddViewModel.searchFilter.modifiedBy = this.defaultValuesService.getEmailId();
      this.commonService.updateSearchFilter(this.searchFilterAddViewModel).subscribe((res) => {
        if (typeof (res) === 'undefined') {
          this.snackbar.open('Search filter updated failed' + sessionStorage.getItem("httpError"), '', {
            duration: 10000
          });
        }
        else {
          if (res._failure) {
            this.snackbar.open(res._message, '', {
              duration: 10000
            });
          }
          else {
            this.snackbar.open(res._message, '', {
              duration: 10000
            });
            
          }
        }
      }
      );
    }
    this.getAllStudent.schoolId = this.searchSchoolId;
    this.getAllStudent.includeInactive = this.inactiveStudents;
    this.getAllStudent.filterParams = this.params;
    this.getAllStudent.sortingModel = null;
    this.getAllStudent.dobStartDate = this.commonFunction.formatDateSaveWithoutTime(this.dobStartDate);
    this.getAllStudent.dobEndDate = this.commonFunction.formatDateSaveWithoutTime(this.dobEndDate);
    this.commonService.setSearchResult(this.params);
    this.studentService.GetAllStudentList(this.getAllStudent).subscribe(data => {
      if (data._failure) {
        this.searchList.emit([]);
        this.toggelValues.emit({inactiveStudents: this.inactiveStudents, searchSchoolId: this.searchSchoolId});
        this.searchValue.emit(this.currentForm.value);
        this.snackbar.open('' + data._message, '', {
          duration: 10000
        });

      } else {
        this.searchList.emit(data);
        this.toggelValues.emit({inactiveStudents: this.inactiveStudents, searchSchoolId: this.searchSchoolId});
        this.searchValue.emit(this.currentForm.value);
        this.showHideAdvanceSearch.emit({ showSaveFilter: this.showSaveFilter , hide: false});
      }
    });
  }

  resetData() {
    this.currentForm.reset();
    this.inactiveStudents = false;
    this.searchSchoolId = this.defaultValuesService.getSchoolID();
    this.submit();
  }

  hideAdvanceSearch() {
    this.showHideAdvanceSearch.emit({ showSaveFilter: null , hide: false});
  }

  ngOnDestroy() {
    this.destroySubject$.next();
    this.destroySubject$.complete();
  }

}
