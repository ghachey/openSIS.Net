import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { CheckSchoolInternalIdViewModel, SchoolAddViewModel } from '../models/school-master.model';
import { AllSchoolListModel, GetAllSchoolModel, OnlySchoolListModel } from '../models/get-all-school.model';
import { BehaviorSubject, Subject } from 'rxjs';
import { DataAvailablity } from '../models/user.model';
import { DefaultValuesService } from '../common/default-values.service';

@Injectable({
  providedIn: 'root'
})
export class SchoolService {
  private schoolId;
  private schoolDetails;
  private messageSource = new BehaviorSubject(false);
  currentMessage = this.messageSource.asObservable();
  apiUrl: string = environment.apiURL;
  constructor(private http: HttpClient,
    private defaultValuesService: DefaultValuesService) {
  }

  GetAllSchoolList(obj: GetAllSchoolModel) {
    obj = this.defaultValuesService.getAllMandatoryVariable(obj);
    let apiurl = this.apiUrl + obj._tenantName + "/School/getAllSchoolList";
    return this.http.post<AllSchoolListModel>(apiurl, obj)
  }

  GetAllSchools(obj: OnlySchoolListModel) {
   obj = this.defaultValuesService.getAllMandatoryVariable(obj);
    let apiurl = this.apiUrl + obj._tenantName + "/School/getAllSchools";
    return this.http.post<AllSchoolListModel>(apiurl, obj);
  }

  ViewSchool(obj: SchoolAddViewModel) {
    obj = this.defaultValuesService.getAllMandatoryVariable(obj);
    obj.schoolMaster.tenantId = this.defaultValuesService.getTenantID();
    let apiurl = this.apiUrl + obj._tenantName + "/School/viewSchool";
    return this.http.post<SchoolAddViewModel>(apiurl, obj)
  }

  AddSchool(obj: SchoolAddViewModel) {
    obj = this.defaultValuesService.getAllMandatoryVariable(obj);
    obj.schoolMaster.tenantId = this.defaultValuesService.getTenantID();
    obj.schoolMaster.schoolDetail[0].schoolLogo = this.schoolImage;
    let apiurl = this.apiUrl + obj._tenantName + "/School/addSchool";
    return this.http.post<SchoolAddViewModel>(apiurl, obj)
  }
  UpdateSchool(obj: SchoolAddViewModel) {
    obj = this.defaultValuesService.getAllMandatoryVariable(obj);
    obj.schoolMaster.tenantId = this.defaultValuesService.getTenantID();
    obj.schoolMaster.schoolDetail[0].schoolLogo = this.schoolImage;
    let apiurl = this.apiUrl + obj._tenantName + "/School/updateSchool";
    return this.http.put<SchoolAddViewModel>(apiurl, obj)
  }
  checkSchoolInternalId(obj: CheckSchoolInternalIdViewModel) {
    obj = this.defaultValuesService.getAllMandatoryVariable(obj);
    let apiurl = this.apiUrl + obj._tenantName + "/School/checkSchoolInternalId";
    return this.http.post<CheckSchoolInternalIdViewModel>(apiurl, obj)
  }

  private schoolImage;
  setSchoolImage(imageInBase64) {
    this.schoolImage = imageInBase64;
  }

  public cloneSchoolImage
  setSchoolCloneImage(image){
    this.cloneSchoolImage = image;
  }
  getSchoolCloneImage(){
    return this.cloneSchoolImage;
  }

  setSchoolId(id: number) {
    this.schoolId = id
  }
  getSchoolId() {
    return this.schoolId;
  }

  private schoolMultiselectValue: any;
  setSchoolMultiselectValue(value: any) {
    this.schoolMultiselectValue = value;
  }
  getSchoolMultiselectValue() {
    return this.schoolMultiselectValue;
  }

  setSchoolDetails(data) {
    this.schoolDetails = data;
  }
  getSchoolDetails() {
    return this.schoolDetails;
  }

  changeMessage(message: boolean) {
    this.messageSource.next(message)
  }

  // Change Category in School
  private category = new Subject;
  categoryToSend = this.category.asObservable();

  changeCategory(category: number) {
    this.category.next(category);
  }

  // Update Mode in School
  private pageMode = new Subject;
  modeToUpdate = this.pageMode.asObservable();

  changePageMode(mode: number) {
    this.pageMode.next(mode);
  }

  // to Update school details in General Info in first view mode.
  private schoolDetailsForGeneral = new Subject;
  getSchoolDetailsForGeneral = this.schoolDetailsForGeneral.asObservable();

  sendDetails(schoolDetailsForGeneral) {
    this.schoolDetailsForGeneral.next(schoolDetailsForGeneral);
  }

  addUpdateSchoolLogo(obj: SchoolAddViewModel){
    obj = this.defaultValuesService.getAllMandatoryVariable(obj);
    obj.schoolMaster.schoolId = this.getSchoolId();
    obj.schoolMaster.tenantId = this.defaultValuesService.getTenantID();
    obj.schoolMaster.schoolDetail[0].id = this.getSchoolId();
    obj.schoolMaster.schoolDetail[0].schoolLogo = this.schoolImage;
    let apiurl = this.apiUrl + obj._tenantName + "/School/addUpdateSchoolLogo";
    return this.http.put<SchoolAddViewModel>(apiurl, obj)
  }

  private changeStatusTo = new BehaviorSubject<DataAvailablity>({schoolChanged:false,schoolLoaded:false,dataFromUserLogin:false,academicYearChanged:false,academicYearLoaded:false});
  schoolListCalled = this.changeStatusTo.asObservable();  

  changeSchoolListStatus(message: DataAvailablity) {
    this.changeStatusTo.next(message)
  }


}
