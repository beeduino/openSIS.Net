import { CommonField } from "../models/commonField";

export class TableCountryModel {    

    public id: number;
    public name: string;
    public countryCode: string;
   
    constructor(){
        this.id= 0;
        this.name=null;
        this.countryCode=null;
        
    }
    
}


export class CountryModel extends CommonField {
    
    public tableCountry : [];
    public stateCount: number;
   
    constructor() {
        super();
        this.tableCountry= null;
        this._tenantName=sessionStorage.getItem('tenant');
        this._token=sessionStorage.getItem('token');
    }
}