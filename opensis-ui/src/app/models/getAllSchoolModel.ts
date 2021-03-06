export class GetAllSchoolModel {
    tenantId:string;
    pageNumber: number;
    pageSize: number;
    sortingModel:sorting;
    filterParams:filterParams;
    _tenantName: string;
    _token: string;
    _failure: boolean;
    _message: string;
constructor() {
    this.tenantId= sessionStorage.getItem("tenantId");
    this.pageNumber=1;
    this.pageSize=10;
    this.sortingModel=new sorting();
    this.filterParams=null;
    this._tenantName=sessionStorage.getItem("tenant");
    this._token=sessionStorage.getItem("token");
    this._failure=false;
    this._message="";
}
}

export class AllSchoolListModel{
    getSchoolForView:[];
    totalCount:number;
    pageNumber:number;
    _pageSize:number;
    _tenantName:string;
    _token:string;
    _failure:boolean;
    _message:string;
}

export class OnlySchoolListModel{
    getSchoolForView: [];
      tenantId: string;
      totalCount: number;
      pageNumber: number;
      _pageSize: number;
      _tenantName: string;
      _token: string;
      _failure: boolean;
      _message: string

      constructor(){
        this.getSchoolForView=null;
        this.tenantId="";
        this.totalCount=null;
        this.pageNumber=null;
        this._pageSize=null;
        this._tenantName="";
        this._token="";
        this._failure=false;
        this._message="";
      }
}

class sorting{
    sortColumn:string;
    sortDirection:string;
    constructor(){
        this.sortColumn="";
        this.sortDirection="";
    }
}

export class filterParams{
       columnName: string;
       filterValue: string;
       filterOption: number;
    constructor(){
        this.columnName=null;
        this.filterOption=3;
        this.filterValue=null;
    }
}


