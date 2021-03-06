import { Component, OnInit,Input,Output,EventEmitter } from '@angular/core';
import { fadeInUp400ms } from '../../../../../@vex/animations/fade-in-up.animation';
import { stagger60ms } from '../../../../../@vex/animations/stagger.animation';
import icEdit from '@iconify/icons-ic/twotone-edit';
import {SchoolAddViewModel } from '../../../../models/schoolMasterModel';
import { SchoolService } from '../../../../services/school.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import {fadeInRight400ms} from '../../../../../@vex/animations/fade-in-right.animation';

import { TranslateService } from '@ngx-translate/core';
import { SharedFunction } from '../../../shared/shared-function';
import { CountryModel } from '../../../../models/countryModel';
import { StateModel } from '../../../../models/stateModel';
import { CityModel } from '../../../../models/cityModel';
import { CommonService } from '../../../../services/common.service';
@Component({
  selector: 'vex-view-general-info',
  templateUrl: './view-general-info.component.html',
  styleUrls: ['./view-general-info.component.scss'],
  animations: [
    stagger60ms,
    fadeInUp400ms,
    fadeInRight400ms
  ]
})
export class ViewGeneralInfoComponent implements OnInit { 
  @Input() generalAndWashInfoData:SchoolAddViewModel; //This is coming from AddSchool on API Call. 
  @Output() parentShowWash :EventEmitter<object> = new EventEmitter<object>();
  @Output("dataOfgeneralInfoFromView") dataOfgeneralInfoFromView: EventEmitter<object> =   new EventEmitter();
  icEdit = icEdit;  
  public internet="";
  public electricity="";
  public status="";
  countryListArr=[];
  stateListArr=[];
  cityListArr=[];
  countryName;
  stateName;
  cityName;
  schoolAddViewModel: SchoolAddViewModel = new SchoolAddViewModel();
  countryModel: CountryModel = new CountryModel();
  stateModel: StateModel = new StateModel();
  cityModel: CityModel = new CityModel();
  constructor(private generalInfoService:SchoolService,
     private snackbar: MatSnackBar,private translateService:TranslateService,
     private commonFunction:SharedFunction,
     private commonService: CommonService
    ) {   
    translateService.use('en');
  } 

  ngOnInit(): void {
    this.getSchoolGeneralInfoDetails();
    this.getAllCountry();
    this.cityName= this.schoolAddViewModel.schoolMaster.city; 
    this.stateName=this.schoolAddViewModel.schoolMaster.state;
    // this.getAllStateByCountry(+this.schoolAddViewModel.schoolMaster.country);
    // this.getAllCitiesByState(+this.schoolAddViewModel.schoolMaster.state);
  }
  editGeneralInfo(){
    this.parentShowWash.emit(this.schoolAddViewModel);    
    this.dataOfgeneralInfoFromView.emit(this.schoolAddViewModel);
  }
  getAllCountry(){
    
    this.commonService.GetAllCountry(this.countryModel).subscribe(data => {
      if (typeof (data) == 'undefined') {
        this.countryListArr=[];
      }
      else {
        if (data._failure) {
          this.countryListArr=[];
        } else {        
          this.countryListArr=data.tableCountry; 
          this.countryListArr.map((val) => {
          var countryInNumber = +this.schoolAddViewModel.schoolMaster.country;  
          
            if(val.id === countryInNumber){
              this.countryName= val.name;
            }
          })  
         
        }
      }
  
    }) 
  
   }
   getAllStateByCountry(data){   
   
    this.stateModel.countryId= data;  
   this.commonService.GetAllState(this.stateModel).subscribe(data => {
     if (typeof (data) == 'undefined') {
       this.stateListArr=[];
     }
     else {
       if (data._failure) {
         this.stateListArr=[];
        
       } else {
         this.cityListArr=[];
         this.stateListArr=data.tableState;      
         this.stateListArr.map((val) => {
          var stateInNumber = +this.schoolAddViewModel.schoolMaster.state;         
            if(val.id === stateInNumber){
              this.stateName= val.name;
            }
          })  
       }
     }
 
   })
  }
  getAllCitiesByState(data){   
    this.cityModel.stateId= data;  
    this.commonService.GetAllCity(this.cityModel).subscribe(val => {
      if (typeof (val) == 'undefined') {
        this.cityListArr=[];
      }
      else {
        if (val._failure) {
          this.cityListArr=[];
        } else {
          this.cityListArr=val.tableCity;   
          this.cityListArr.map((val) => {
            var cityInNumber = +this.schoolAddViewModel.schoolMaster.city;         
              if(val.id === cityInNumber){
                this.cityName= val.name;
              }
            })   
        }
      }
  
    }) 
  
   }
  getSchoolGeneralInfoDetails()
  {    
      if(this.generalAndWashInfoData._failure){
        this.snackbar.open('School information failed. '+ this.generalAndWashInfoData._message, 'LOL THANKS', {
        duration: 10000
        });      
      }else{   
        this.schoolAddViewModel=this.generalAndWashInfoData;         
        this.status= this.schoolAddViewModel.schoolMaster.schoolDetail[0].status?'Active':'Inactive';
        this.schoolAddViewModel.schoolMaster.schoolDetail[0].dateSchoolOpened= this.commonFunction.formatDate(this.schoolAddViewModel.schoolMaster.schoolDetail[0].dateSchoolOpened);
        this.schoolAddViewModel.schoolMaster.schoolDetail[0].dateSchoolClosed= this.commonFunction.formatDate(this.schoolAddViewModel.schoolMaster.schoolDetail[0].dateSchoolClosed);
      }
  }

}
