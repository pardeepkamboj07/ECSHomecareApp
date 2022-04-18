import { Component, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { ClientContactLog } from 'src/app/models/client/client-contactlog-model';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { ClientApiService } from 'src/app/services/client-api.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList, MasterType } from 'src/app/models/common';
import {  UserModel } from 'src/app/models/account/login-model';
import { AccountService } from 'src/app/services/account.service';
import { DiagnosisModel } from 'src/app/models/client/diagnosis-model';

@Component({
    selector: 'app-diagnosis',
    templateUrl: './diagnosis.component.html',
    styleUrls: [
      '../../../assets/css/orange-blue.css',      
      './diagnosis.component.scss']
})
export class DiagnosisComponent implements OnInit {
  isAddVisible: Boolean = true;
  isUpdateVisible: Boolean = false;
  contactLogId: number = 0;
  currentUser: UserModel;
  modalRef?: BsModalRef;
  model = new DiagnosisModel();
  modelList:DiagnosisModel[]=[];
 
  @ViewChild("templatelog") templatelog: TemplateRef<any>;

  constructor(
    private comApi: CommonService,
    private route: ActivatedRoute,
    private modalService: BsModalService,
    private accountApi: AccountService,
    private clientapi: ClientApiService
  ) {
    this.model.isActive = 1;
    this.model.entityId = 0;
    this.currentUser = this.accountApi.getCurrentUser();
   
  }

  ngOnInit(): void {
    this.route.params.subscribe(
      (params: Params) => {
        this.isAddVisible = true;
        this.isUpdateVisible = false;
        this.model.userId = Number(params["clientId"]);
     
        this.getDiagnosisList();
      }
    );
  }

  saveModel() {
    debugger;
    this.model.dxId = Number(this.model.dxId);
    this.model.orderNo = Number(this.model.orderNo); 
    this.model.isActive = Number(this.model.isActive);
    this.model.createdBy = this.currentUser.userId;
    this.model.userId = Number(this.model.userId);
    this.clientapi.addDiagnosis(this.model).subscribe(Responce => {
      this.decline();
      this.getDiagnosisList();
    })
  }

  getDiagnosisList() {
    this.clientapi.getDiagnosisModel(this.model.userId).subscribe(Responce => {

      this.modelList = Responce.data;
    });
  }
  // updateContactLogData(diagnosisId: number) {
  //   this.contactLogId = diagnosisId;
  //   this.clientapi.getClientContactLogDetails(contactlogId).subscribe(Responce => {
  //     if (Responce.data.length > 0) {
  //       this.model.officeUserId = Number(Responce.data[0].officeUserId);
  //       this.model.empId = Number(Responce.data[0].empId);
  //       this.model.reason = Responce.data[0].reason;
  //       this.model.callDateTime = new Date(Responce.data[0].callDateTime);
  //       this.model.scheduleDate = new Date(Responce.data[0].scheduleDate);
  //       this.model.followUpDate = new Date(Responce.data[0].followUpDate);
  //       this.model.issue = Responce.data[0].issue;
  //       this.model.notes = Responce.data[0].notes;
  //       this.model.actionTaken = Responce.data[0].actionTaken;
  //       this.model.isFollowUp = Responce.data[0].isFollowUp;
  //       this.model.isSchedule = Responce.data[0].isSchedule;
  //       this.isAddVisible = false;
  //       this.isUpdateVisible = true;
  //       this.openModal(this.templatelog);
  //     }
  //   });
  // }

  // updateContactLog() {
  //   debugger;
  //   this.model.officeUserId = Number(this.model.officeUserId);
  //   this.model.empId = Number(this.model.empId);
  //   this.model.reason = this.model.reason;
  //   this.model.callDateTime = this.model.callDateTime;
  //   this.model.scheduleDate = this.model.scheduleDate;
  //   this.model.followUpDate = this.model.followUpDate;
  //   this.model.issue = this.model.issue;
  //   this.model.notes = this.model.notes;
  //   this.model.actionTaken = this.model.actionTaken;
  //   this.model.isFollowUp = this.model.isFollowUp;
  //   this.model.isSchedule = this.model.isSchedule;
  //   this.model.contactlogId = this.contactLogId;
  //   this.clientapi.updateClientContactLog(this.model).subscribe(Responce => {
  //     debugger;
  //     this.decline();
  //     this.getDiagnosisList();
  //   })
  // }
  delDiagnosis(diagnosisId: number) {
    debugger;
    this.clientapi.deleteDiagnosis(diagnosisId).subscribe((response) => {
      this.getDiagnosisList();
      this.decline();
    });
  }
  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template);
  }
  decline(): void {
    this.model = new DiagnosisModel();
    this.modalRef?.hide();
  }
}