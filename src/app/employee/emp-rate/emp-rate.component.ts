import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { EmployeeapiService } from 'src/app/services/employeeapi.service';
import { ClientApiService } from 'src/app/services/client-api.service';
import { ItemsList } from 'src/app/models/common';
import { CommonService } from 'src/app/services/common.service';
import { Router,ActivatedRoute, Params } from '@angular/router';
import{EmpRate,EmployeeRateModel} from 'src/app/models/employee/emp-rate'
import { AccountService } from 'src/app/services/account.service';
import { UserModel } from 'src/app/models/account/login-model';
import { setTheme } from 'ngx-bootstrap/utils';
@Component({
  selector: 'app-emp-rate',
  templateUrl: './emp-rate.component.html',
  styleUrls: [
    
    '../../../assets/css/orange-blue.css',
    './emp-rate.component.scss']
})
export class EmpRateComponent implements OnInit {
  modalRef?: BsModalRef;
  ClientList :ItemsList[] = [];
  PayerList:ItemsList[] = [];
  EmpRateObj:EmpRate[]=[];
 EmpId:number;
 ClientId:number;
  model:EmployeeRateModel;

  currentUser:UserModel;
   



  constructor(private comApi: CommonService,
    private route:ActivatedRoute,
    private accountApi: AccountService,
    private modalService: BsModalService, 
    private empApi: EmployeeapiService, 
    private clientapi : ClientApiService) { 

      setTheme('bs3');
      this.currentUser=this.accountApi.getCurrentUser();

      this.comApi.getClientList().subscribe((response) => {
        if(response.result)
        {
          debugger;
          this.ClientList = response.data;
        }
      });
      this.comApi.getEmpList().subscribe((response) => {
        if(response.result)
        {
          debugger;
          this.PayerList = response.data;
        }
      });
    }

  ngOnInit(): void {
    this.route.params.subscribe(
      (params : Params) =>{
         this.EmpId = Number(params["empId"]);
         this.GetEmployeeRateLst();
      }
    ); 

   
  }

  openModal(template: TemplateRef<any>) { 
   this.modalRef = this.modalService.show(template);
 }


 decline(): void {
   
  this.modalRef?.hide();
}

onClickSubmit() {     
 debugger;

 this.model.userId=Number(this.model.empId);

 this.model.createdBy=this.currentUser.userId;

  this.model.hourly=Number(this.model.hourly);
  this.model.livein=Number(this.model.livein);
  this.model.visit=Number(this.model.visit);
  this.model.overHourly=Number(this.model.overHourly);
  this.model.overLivein=Number(this.model.overLivein);
  this.model.overVisit=Number(this.model.overVisit);  
  this.model.optionalHour=Number(this.model.optionalHour);
  this.model.optionalAddHour=Number(this.model.optionalAddHour);
  this.model.travelTime=Number(this.model.travelTime);    
  this.model.gas=Number(this.model.gas);
  this.model.extra=Number(this.model.extra);
  this.model.mileage=Number(this.model.mileage); 
  this.model.payerId=Number(this.model.payerId);
  this.model.clientId=Number(this.model.clientId);
  this.model.applyRateCheck=Boolean(this.model.applyRateCheck);    
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



}
