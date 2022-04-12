import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { EmployeeapiService } from 'src/app/services/employeeapi.service';
import { ClientApiService } from 'src/app/services/client-api.service';

import { Router,ActivatedRoute, Params } from '@angular/router';
import{ClientStatusModel} from 'src/app/models/client/status-model';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType} from 'src/app/models/common';

import {  TaskModel,ServiceTaskView,ServicetaskObj,ServiceTaskModel}  from 'src/app/models/client/service-task-model';
@Component({
  selector: 'app-service-task',
  templateUrl: './service-task.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './service-task.component.scss']
})
export class ServiceTaskComponent implements OnInit {

  
  clientId:number;
  taskLst:ServicetaskObj[]=[];
  srvLst:ServiceTaskModel[]=[];

  srvTaskLst:ServiceTaskView[]=[];
  modalRef?: BsModalRef;
  constructor(private comApi: CommonService,
    private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService, private clientApi : ClientApiService) {
      setTheme('bs3');

      this.comApi.getTaskList().subscribe((response) => {
        if(response.result)
        {response.data.forEach((x: TaskModel) => {
            this.taskLst.push(new ServicetaskObj(x.taskId,x.taskCode,x.taskName));
          });
        }
      });
  
      
     }

     ngOnInit(): void {
      this.route.params.subscribe(
        (params : Params) =>{   
          this.clientId = Number(params["clientId"]);  
          
          this.bindServiceLst(this.clientId);

      
        });
    }
    openModal(template: TemplateRef<any>) {
      
     this.modalRef = this.modalService.show(template);
   }
   
   decline(): void {
    
     this.modalRef?.hide();
   }
   bindServiceLst(clientId:number) { 

    debugger;
    this.clientApi.getServiceTaskList(clientId).subscribe((response) => {
      if(response.result)
      {
        debugger;
        this.srvTaskLst = response.data;
      }
    });
   }


   addService() { 
     debugger;

    this.taskLst.forEach((x: ServicetaskObj) => {
let obj=new ServiceTaskModel(x.taskId,x.frequency,x.serviceNote);
obj.userId=this.clientId;
      this.srvLst.push(obj);
   
    });
debugger;
    this.clientApi.createServiceTask( this.srvLst).subscribe((response) => { 
      this.bindServiceLst(this.clientId);
    });
  
  }


 }






















