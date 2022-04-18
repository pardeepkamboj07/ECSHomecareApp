import { Component, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { ClientContactLog } from 'src/app/models/client/client-contactlog-model';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { ClientApiService } from 'src/app/services/client-api.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList, MasterType } from 'src/app/models/common';
import { LoginModel, UserModel } from 'src/app/models/account/login-model';
import { AccountService } from 'src/app/services/account.service';
import { OtherInfoModel } from 'src/app/models/client/other-info-model';

@Component({
  selector: 'app-other-information',
  templateUrl: './other-information.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './other-information.component.scss']
})
export class OtherInformationComponent implements OnInit {
  modalRef?: BsModalRef;
  currentUser: UserModel;
  model = new OtherInfoModel();
  constructor(
    private comApi: CommonService,
    private route: ActivatedRoute,
    private modalService: BsModalService,
    private accountApi: AccountService,
    private clientapi: ClientApiService
  ) {

    this.currentUser = this.accountApi.getCurrentUser();
 
  }

  ngOnInit(): void {
  }

}