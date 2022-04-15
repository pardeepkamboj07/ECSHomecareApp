import { Component, OnInit,TemplateRef } from '@angular/core';
import{ClientContactLog} from 'src/app/models/client/client-contactlog-model';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { ClientApiService } from 'src/app/services/client-api.service';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType} from 'src/app/models/common';
import { LoginModel,UserModel } from 'src/app/models/account/login-model';
import { AccountService } from 'src/app/services/account.service';

@Component({
  selector: 'app-client-contactlog-list',
  templateUrl: './client-contactlog-list.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './client-contactlog-list.component.scss']
})
export class ClientContactlogListComponent implements OnInit {
  modalRef?: BsModalRef;
  ClientId:number;
  ClientContactLogObjList:any;
  empList = Array<ItemsList>();
  model=new ClientContactLog();
  currentUser:UserModel;  
  constructor(
    private comApi: CommonService,
    private route:ActivatedRoute,
    private modalService: BsModalService,
    private accountApi: AccountService,
    private clientapi : ClientApiService
     ) {
      this. model.isActive=1;
      this.currentUser=this.accountApi.getCurrentUser();
      this.comApi.getEmpList().subscribe((response) => {
        if(response.result)
        {          
          this.empList = response.data;
        }
      });
   }
   
  ngOnInit(): void {
    this.route.params.subscribe(
      (params : Params) =>{
         this.model.userId = Number(params["clientId"]);
         this.ClientId = Number(params["clientId"]);  
         this.getClientContactLogRecord(); 
      }
    );

  }

  saveContactLog()
  {
    debugger;
    this.model.officeUserId=Number(this.model.officeUserId);
    this.model.empId=Number(this.model.empId);
    this.model.reason=this.model.reason;
    this.model.callDateTime=this.model.callDateTime;
    this.model.scheduleDate=this.model.scheduleDate;
    this.model.followUpDate=this.model.followUpDate;
    this.model.issue=this.model.issue;
    this.model.notes=this.model.notes;
    this.model.actionTaken=this.model.actionTaken;
    this.model.isFollowUp=this.model.isFollowUp;
    this.model.isSchedule=this.model.isSchedule;
    this.model.isActive=Number(this.model.isActive);
    this.model.createdBy=this.currentUser.userId;
    this.model.userId=Number(this.model.userId);    
    this.clientapi.SaveClientContactLog(this.model).subscribe(Responce=>{      
      this.decline();      
      this.getClientContactLogRecord();
     })

  }

  getClientContactLogRecord()
  {
    this.clientapi.getClientContactLogRecord(this.ClientId).subscribe(Responce=>{
        
      this.ClientContactLogObjList=Responce.data;
    });
  }
  openModal(template: TemplateRef<any>) {    
    this.modalRef = this.modalService.show(template);
  }
  decline(): void {  
    this.modalRef?.hide();
  }
}
