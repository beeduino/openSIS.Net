import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';
import { StudentAddModel, StudentListModel, StudentResponseListModel, GetAllStudentDocumentsList, StudentDocumentAddModel, StudentSiblingSearch, StudentSiblingAssociation, StudentViewSibling, CheckStudentInternalIdViewModel } from '../models/studentModel';
import { StudentCommentsAddView, StudentCommentsListViewModel } from '../models/studentCommentsModel'
import { BehaviorSubject, Subject } from 'rxjs';
import { GetAllParentInfoModel, AddParentInfoModel, ParentInfoList } from '../models/studentModel';
import { CryptoService } from './Crypto.service';
@Injectable({
  providedIn: 'root'
})
export class StudentService {
  apiUrl: string = environment.apiURL;
  private currentYear = new BehaviorSubject(false);
  currentY = this.currentYear.asObservable();

  constructor(private http: HttpClient, private cryptoService: CryptoService) { }

  AddStudent(obj: StudentAddModel) {
    obj.passwordHash = this.cryptoService.encrypt(obj.passwordHash);
    let apiurl = this.apiUrl + obj._tenantName + "/Student/addStudent";
    obj.studentMaster.studentPhoto = this.studentImage;
    return this.http.post<StudentAddModel>(apiurl, obj)
  }

  viewStudent(obj: StudentAddModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/viewStudent";
    return this.http.post<StudentAddModel>(apiurl, obj)
  }

  UpdateStudent(obj: StudentAddModel) {
    obj.passwordHash = this.cryptoService.encrypt(obj.passwordHash);
    let apiurl = this.apiUrl + obj._tenantName + "/Student/updateStudent";
    obj.studentMaster.studentPhoto = this.studentImage;
    return this.http.put<StudentAddModel>(apiurl, obj)
  }

  GetAllStudentList(obj: StudentListModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/getAllStudentList";
    return this.http.post<StudentResponseListModel>(apiurl, obj)
  }

  checkStudentInternalId(obj: CheckStudentInternalIdViewModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/checkStudentInternalId";
    return this.http.post<CheckStudentInternalIdViewModel>(apiurl, obj)
  }



  private category = new Subject;
  categoryToSend = this.category.asObservable();

  changeCategory(category: number) {
    this.category.next(category);
  }

  private studentDetails;
  setStudentDetails(data) {
    this.studentDetails = data;
  }
  getStudentDetails() {
    return this.studentDetails;
  }

  private studentId: number;
  setStudentId(id: number) {
    this.studentId = id
  }
  getStudentId() {
    return this.studentId;
  }

  private studentImage;
  setStudentImage(imageInBase64) {
    this.studentImage = imageInBase64;
  }

  //Student comment
  addStudentComment(obj: StudentCommentsAddView) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/addStudentComment";
    return this.http.post<StudentCommentsAddView>(apiurl, obj)
  }
  updateStudentComment(obj: StudentCommentsAddView) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/updateStudentComment";
    return this.http.put<StudentCommentsAddView>(apiurl, obj)
  }
  deleteStudentComment(obj: StudentCommentsAddView) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/deleteStudentComment";
    return this.http.post<StudentCommentsAddView>(apiurl, obj)
  }
  getAllStudentCommentsList(obj: StudentCommentsListViewModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/getAllStudentCommentsList";
    return this.http.post<StudentCommentsListViewModel>(apiurl, obj)
  }

  // to Update student details in General for first time.
  private studentDetailsForGeneralInfo = new Subject;
  getStudentDetailsForGeneral = this.studentDetailsForGeneralInfo.asObservable();

  sendDetails(studentDetailsForGeneralInfo) {
    this.studentDetailsForGeneralInfo.next(studentDetailsForGeneralInfo);
  }

  GetAllStudentDocumentsList(obj: GetAllStudentDocumentsList) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/getAllStudentDocumentsList";
    return this.http.post<GetAllStudentDocumentsList>(apiurl, obj)
  }
  AddStudentDocument(obj: StudentDocumentAddModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/addStudentDocument";
    return this.http.post<StudentDocumentAddModel>(apiurl, obj)
  }
  DeleteStudentDocument(obj: StudentDocumentAddModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/Student/deleteStudentDocument";
    return this.http.post<StudentDocumentAddModel>(apiurl, obj)
  }

  viewParentListForStudent(obj: GetAllParentInfoModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/ParentInfo/viewParentListForStudent";
    return this.http.post<GetAllParentInfoModel>(apiurl, obj)
  }
  addParentForStudent(obj: AddParentInfoModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/ParentInfo/addParentForStudent";
    return this.http.post<AddParentInfoModel>(apiurl, obj)
  }
  deleteParentInfo(obj: AddParentInfoModel) {
    let apiurl = this.apiUrl + obj._tenantName + "/ParentInfo/deleteParentInfo";
    return this.http.post<AddParentInfoModel>(apiurl, obj)
  }

  searchParentInfoForStudent(obj: ParentInfoList) {
    let apiurl = this.apiUrl + obj._tenantName + "/ParentInfo/searchParentInfoForStudent";
    return this.http.post<ParentInfoList>(apiurl, obj)
  }

  // Student Sibling
  siblingSearch(searchDetails: StudentSiblingSearch) {
    let apiurl = this.apiUrl + searchDetails._tenantName + "/Student/siblingSearch";
    return this.http.post<StudentSiblingSearch>(apiurl, searchDetails)
  }
  associationSibling(studentDetails: StudentSiblingAssociation) {
    let apiurl = this.apiUrl + studentDetails._tenantName + "/Student/associationSibling";
    return this.http.post<StudentSiblingAssociation>(apiurl, studentDetails)
  }
  viewSibling(studentDetails: StudentViewSibling) {
    let apiurl = this.apiUrl + studentDetails._tenantName + "/Student/viewSibling";
    return this.http.post<StudentViewSibling>(apiurl, studentDetails)
  }
  removeSibling(studentDetails: StudentSiblingAssociation) {
    let apiurl = this.apiUrl + studentDetails._tenantName + "/Student/removeSibling";
    return this.http.post<StudentSiblingAssociation>(apiurl, studentDetails)
  }


}
