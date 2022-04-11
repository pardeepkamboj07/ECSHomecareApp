import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { EmployeeapiService } from 'src/app/services/employeeapi.service';
import { ClientApiService } from 'src/app/services/client-api.service';

import { Router,ActivatedRoute, Params } from '@angular/router';
import{ClientStatusModel} from 'src/app/models/client/status-model';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType} from 'src/app/models/common';

import {  TaskModel,ServiceTaskView}  from 'src/app/models/client/service-task-model';
@Component({
  selector: 'app-service-task',
  templateUrl: './service-task.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './service-task.component.scss']
})
export class ServiceTaskComponent implements OnInit {

  
  ClientId:number;
  taskLst:TaskModel[]=[];
  srvTaskLst:ServiceTaskView[]=[];

  constructor(private comApi: CommonService,
    private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService, private clientApi : ClientApiService) {
      setTheme('bs3');

      this.comApi.getTaskList().subscribe((response) => {
        if(response.result)
        {
          debugger;
          this.taskLst = response.data;
        }
      });
  
      
     }

     ngOnInit(): void {
      this.route.params.subscribe(
        (params : Params) =>{   
          this.ClientId = Number(params["clientId"]); 
          this.GetClientStatusLst();

          this.clientApi.getServiceTaskList(this.ClientId).subscribe((response) => {
            if(response.result)
            {
              debugger;
              this.srvTaskLst = response.data;
            }
          });
        });
    }
    openModal(template: TemplateRef<any>) {
      
     this.modalRef = this.modalService.show(template);
   }
   
   decline(): void {
    
     this.modalRef?.hide();
   }

  EmplList = Array<ItemsList>(); 
  ActivityLst: ItemsList[] = [];
  ReferralCodeLst: ItemsList[] = [];
  OfficeUser: ItemsList[] = [];
  
 
  modalRef?: BsModalRef;
   model = new ClientStatusModel(0,'',0,'',0,0,0,0,false,false,false);
   ClientStatusObjList:any;
   

  

 onClickSubmit() {     
  this.model.activityId=Number(this.model.activityId);
  this.model.date=this.model.date;
  this.model.note=this.model.note;
  this.model.officeUserId=Number(this.model.officeUserId);
  this.model.text=Boolean(this.model.text);
  this.model.screen=Boolean(this.model.screen);
  this.model.email=Boolean(this.model.email);
  this.model.officeUserReferralID=Number(this.model.officeUserReferralID);
  this.model.referralCode=Number(this.model.referralCode);  
  this.model.clientId=Number(this.ClientId);  
  this.clientapi.SaveClientStatus(this.model).subscribe((response) => {
    // this.modalRef?.hide();
    this.decline();   
this.GetClientStatusLst();
    
   
  }); 
}



GetOfficeUserLst() {
 
 this.comApi.getEmployees('Applicant HHA').subscribe((response) => {
  this.OfficeUser = response.data;
});
}


GetEmpLst() {
 
  this.comApi.getEmpList().subscribe((response) => {
   
    this.EmplList = response.data;      
  });
 }


 GetClientStatusLst(){
this.clientapi.getClientStatusList(this.ClientId).subscribe((response)=>{
  this.ClientStatusObjList=response.data
})

 }






















}
