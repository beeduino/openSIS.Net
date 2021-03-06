import { CommonField } from "../models/commonField";
import { FieldsCategoryModel } from './fieldsCategoryModel';

export class StudentMasterModel {
    public tenantId: string;
    public schoolId: number;
    public studentId: number;
    public studentInternalId: string;
    public studentPortalId: string;
    public alternateId: string;
    public districtId: number;
    public stateId: number;
    public admissionNumber: string;
    public rollNumber: string;
    public salutation: string;
    public firstGivenName: string;
    public middleName: string;
    public lastFamilyName: string;
    public suffix: string;
    public preferredName: string;
    public previousName: string;
    public socialSecurityNumber: string;
    public otherGovtIssuedNumber: string;
    public studentPhoto: string;
    public dob: string;
    public displayAge: string;
    public gender: string;
    public race: string;
    public ethnicity: string;
    public maritalStatus: string;
    public countryOfBirth: number;
    public nationality: number;
    public firstLanguageId: number;
    public secondLanguageId: number;
    public thirdLanguageId: number;
    public sectionId: number;
    public estimatedGradDate: string;
    public eligibility504: boolean;
    public economicDisadvantage: boolean;
    public freeLunchEligibility: boolean;
    public specialEducationIndicator: boolean;
    public lepIndicator: boolean;
    public homePhone: string;
    public mobilePhone: string;
    public personalEmail: string;
    public schoolEmail: string;
    public twitter: string;
    public facebook: string;
    public instagram: string;
    public youtube: string;
    public linkedin: string;
    public homeAddressLineOne: string;
    public homeAddressLineTwo: string;
    public homeAddressCity: string;
    public homeAddressState: string;
    public homeAddressZip: string;
    public busNo: string;
    public schoolBusPickUp: boolean;
    public schoolBusDropOff: boolean;
    public mailingAddressSameToHome: boolean;
    public mailingAddressLineOne: string;
    public mailingAddressLineTwo: string;
    public mailingAddressCity: string;
    public mailingAddressState: string;
    public mailingAddressZip: string;
    public primaryContactRelationship: string;
    public primaryContactFirstname: string;
    public primaryContactLastname: string;
    public primaryContactHomePhone: string;
    public primaryContactWorkPhone: string;
    public primaryContactMobile: string;
    public primaryContactEmail: string;
    public isPrimaryCustodian: boolean;
    public isPrimaryPortalUser: boolean;
    public primaryPortalUserId: string;
    public primaryContactStudentAddressSame: boolean;
    public primaryContactAddressLineOne: string;
    public primaryContactAddressLineTwo: string;
    public primaryContactCity: string;
    public primaryContactState: string;
    public primaryContactZip: string;
    public secondaryContactRelationship: string;
    public secondaryContactFirstname: string;
    public secondaryContactLastname: string;
    public secondaryContactHomePhone: string;
    public secondaryContactWorkPhone: string;
    public secondaryContactMobile: string;
    public secondaryContactEmail: string;
    public isSecondaryCustodian: boolean;
    public isSecondaryPortalUser: boolean;
    public secondaryPortalUserId: string;
    public secondaryContactStudentAddressSame: boolean;
    public secondaryContactAddressLineOne: string;
    public secondaryContactAddressLineTwo: string;
    public secondaryContactCity: string;
    public secondaryContactState: string;
    public secondaryContactZip: string;
    public homeAddressCountry: number;
    public mailingAddressCountry: number;
    public address: string;
    public schoolName: string;
    public criticalAlert: string;
    public alertDescription: string;
    public primaryCarePhysician: string;
    public primaryCarePhysicianPhone: string;
    public medicalFacility: string;
    public medicalFacilityPhone: string;
    public insuranceCompany: string;
    public insuranceCompanyPhone: string;
    public policyNumber: string;
    public policyHolder: string;
    public dentist: string;
    public dentistPhone: string;
    public vision: string;
    public visionPhone: string;
    public schoolMaster: Object;
    constructor() {
        this.tenantId = sessionStorage.getItem("tenantId");
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
    }
}

export class StudentAddModel extends CommonField {
    public studentMaster: StudentMasterModel;
    public schoolMaster: {};
    public fieldsCategoryList: [FieldsCategoryModel];
    public selectedCategoryId: number;
    public loginEmail: string;
    public passwordHash: string;
    public studentEnrollment: {};
    constructor() {
        super();
        this.studentMaster = new StudentMasterModel();
        this.schoolMaster = null;
        this.studentEnrollment = null;
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}

export class CheckStudentInternalIdViewModel extends CommonField {
    public tenantId: string;
    public studentInternalId: string;
    public isValidInternalId: boolean;
    constructor() {
        super();
        this.tenantId = sessionStorage.getItem("tenantId");
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}


export class StudentResponseListModel {
    public getStudentListForViews: [];
    public tenantId: string;
    public schoolId: number;
    public totalCount: number;
    public pageNumber: number;
    public _pageSize: number;
    public _tenantName: string;
    public _token: string;
    public _failure: string;
    public _message: string;
}

export class StudentListModel extends CommonField {
    public studentMaster: [];
    public totalCount: number;
    public tenantId: string;
    public schoolId: number;
    public pageNumber: number;
    public pageSize: number;
    public sortingModel: sorting;
    public filterParams: filterParams;
    constructor() {
        super();
        this.tenantId = sessionStorage.getItem("tenantId");
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this.pageNumber = 1;
        this.pageSize = 10;
        this.sortingModel = new sorting();
        this.filterParams = null;
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}


class sorting {
    sortColumn: string;
    sortDirection: string;
    constructor() {
        this.sortColumn = "";
        this.sortDirection = "";
    }
}
export class filterParams {
    columnName: string;
    filterValue: string;
    filterOption: number;
    constructor() {
        this.columnName = null;
        this.filterOption = 3;
        this.filterValue = null;
    }
}
export class StudentDocumentListModel {
    public tenantId: string;
    public schoolId: number;
    public studentId: number;
    public documentId: number;
    public fileUploaded: string;
    public uploadedOn: string;
    public uploadedBy: string;
    public studentMaster: {};
    constructor() {
        this.tenantId = sessionStorage.getItem("tenantId");
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this.studentId = +localStorage.getItem("studentId");
    }
}

export class GetAllStudentDocumentsList extends CommonField {
    public studentDocumentsList: [];
    public tenantId: string;
    public schoolId: number;
    public studentId: number;

    constructor() {
        super();
        this.tenantId = sessionStorage.getItem("tenantId");
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this.studentId = +localStorage.getItem("studentId");
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}

export class StudentDocumentAddModel extends CommonField {
    public studentDocuments: Array<string>;
    public tenantId: string;
    public schoolId: number;
    public studentId: number;
    public documentId: number;
    public fileUploaded: string;
    public uploadedOn: string;
    public uploadedBy: string;
    public studentMaster: {};
    constructor() {
        super();
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}

export class StudentSiblingSearch extends CommonField {
    getStudentForView: [StudentMasterModel]
    tenantId: string;
    schoolId: number;
    firstGivenName: string;
    lastFamilyName: string;
    gradeLevel: string;
    studentInternalId: string;
    dob: string;
    constructor() {
        super();
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this.tenantId = sessionStorage.getItem("tenantId");
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}

export class StudentViewSibling extends CommonField {
    studentMaster: [StudentMasterModel]
    tenantId: string;
    schoolId: number;
    studentId: number;
    constructor() {
        super();
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this.tenantId = sessionStorage.getItem("tenantId");
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}

export class StudentSiblingAssociation extends CommonField {
    studentMaster: StudentMasterModel;
    schoolId: number;
    studentId: number;
    constructor() {
        super();
        this.studentMaster = new StudentMasterModel()
        this.studentMaster.tenantId = sessionStorage.getItem("tenantId");
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}


export class GetAllParentInfoModel extends CommonField {
    public parentInfoList: [];
    public tenantId: string;
    public schoolId: number;
    public studentId: number;
    constructor() {
        super();
        this.tenantId = sessionStorage.getItem("tenantId");
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this.studentId = +localStorage.getItem("studentId");
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}

export class ParentInfoModel {
    public tenantId: string;
    public schoolId: number;
    public studentId: number;
    public parentId: number;
    public relationShip: string;
    public firstname: string;
    public lastname: string;
    public homePhone: string;
    public workPhone: string;
    public mobile: string;
    public email: string;
    public studentAddressSame: boolean;
    public addressLineOne: string;
    public addressLineTwo: string;
    public country: string;
    public city: string;
    public state: string;
    public zip: string;
    public isCustodian: boolean;
    public isPortalUser: boolean;
    public portalUserId: string;
    public busNo: string;
    public busPickup: boolean;
    public busDropoff: boolean;
    public contactType: string;
    public associationship: string;
    public lastUpdated: string;
    public updatedBy: string;
    public salutation: string;
    public middleName: string;
    public personalEmail: string;
    public workEmail: string;
    public userProfile: string;
    public loginEmail: string;
    public suffix: string;
    public studentMaster: {};
    constructor() {

        this.tenantId = sessionStorage.getItem("tenantId");
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this.studentId = +localStorage.getItem("studentId");

    }
}

export class AddParentInfoModel extends CommonField {
    public parentInfo: ParentInfoModel;
    public passwordHash: number;
    public getStudentForView: [];

    constructor() {
        super();
        this.parentInfo = new ParentInfoModel();
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");

    }
}

export class ParentInfoList extends CommonField {
    public parentInfoForView: [];
    public tenantId: string;
    public schoolId: number;
    public totalCount: number;
    public pageNumber: number;
    public _pageSize: number;

    constructor() {
        super();
        this.tenantId = sessionStorage.getItem("tenantId");
        this.schoolId = +sessionStorage.getItem("selectedSchoolId");
        this.totalCount = 0;
        this.pageNumber = 0;
        this._pageSize = 0;
        this._tenantName = sessionStorage.getItem("tenant");
        this._token = sessionStorage.getItem("token");
    }
}




