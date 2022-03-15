import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { ClientApiService } from 'src/app/Service/client-api.service';
import { ItemsList } from 'src/app/Model/common';
import { Router,ActivatedRoute, Params } from '@angular/router';
import{EmpRate} from 'src/app/Model/Employee/emp-rate'

@Component({
  selector: 'app-emp-rate',
  templateUrl: './emp-rate.component.html',
  styleUrls: [
    
    '../../../assets/css/orange-blue.css',
    './emp-rate.component.scss']
})
export class EmpRateComponent implements OnInit {
  modalRef?: BsModalRef;
  ClientList :any;
  PayerList:any;  
  EmpRateObj:any;
 EmpId:number;
 ClientId:number;
  model=new EmpRate("","","","",0,0,0,0,0,0,false,0,0,0,0,0,0,0,0,0);
  constructor(private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService, private clientapi : ClientApiService) { }

  ngOnInit(): void {
    this.EmpId=0;
    this.ClientId=0;
    this.GetEmployeeRateLst();
    // this.route.params.subscribe(
    //   (params : Params) =>{
    //      this.EmpId = Number(params["eId"]);
    //      this.GetEmployeeRateLst(EmpId);
    //   }
    // );
   
  }

  openModal(template: TemplateRef<any>) {
    this.BindClientList();
    this.GetEmployeeLst();
   this.modalRef = this.modalService.show(template);
 }


 decline(): void {
   
  this.modalRef?.hide();
}

onClickSubmit() {     
 debugger;
  this.model.Hourly=Number(this.model.Hourly);
  this.model.Livein=Number(this.model.Livein);
  this.model.Visit=Number(this.model.Visit);
  this.model.OverHourly=Number(this.model.OverHourly);
  this.model.OverLivein=Number(this.model.OverLivein);
  this.model.OverVisit=Number(this.model.OverVisit);  
  this.model.OptionalHour=Number(this.model.OptionalHour);
  this.model.OptionalAddHour=Number(this.model.OptionalAddHour);
  this.model.TravelTime=Number(this.model.TravelTime);    
  this.model.Gas=Number(this.model.Gas);
  this.model.Extra=Number(this.model.Extra);
  this.model.Mileage=Number(this.model.Mileage); 
  this.model.PayerId=Number(this.model.PayerId);
  this.model.ClientId=Number(this.model.ClientId);
  this.model.ApplyRateCheck=Boolean(this.model.ApplyRateCheck);    
  this.empApi.SaveEmployeeRate(this.model).subscribe((response) => {
      
      this.GetEmployeeRateLst();  
    this.decline();
  
   }); 
}

GetEmployeeRateLst() {
 
  this.empApi.GetEmployeeRateLst(this.EmpId).subscribe((response) => {
    this.EmpRateObj = response.data;      
  });
}

GetEmployeeLst() {
  this.empApi.GetEmployeeLst().subscribe((response) => {
    this.PayerList = response.data;      
  });
}

BindClientList() {
  // this.IsLoad = true;
 
  this.clientapi.getClientList().subscribe(response => {
    this.ClientList = response.data;  
  });
}

}
