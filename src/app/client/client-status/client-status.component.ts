import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { ClientApiService } from 'src/app/Service/client-api.service';

import { Router,ActivatedRoute, Params } from '@angular/router';
import{Empstatus} from 'src/app/Model/Employee/empstatus';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType} from 'src/app/Model/common';

@Component({
  selector: 'app-client-status',
  templateUrl: './client-status.component.html',
  styleUrls: ['./client-status.component.scss']
})
export class ClientStatusComponent implements OnInit {
  EmplList = Array<ItemsList>(); 
  ActivityLst: ItemsList[] = [];
  ReferralCodeLst: ItemsList[] = [];
  OfficeUser:any;
  
  ScheduleLst :any;
  modalRef?: BsModalRef;
   model = new Empstatus('',false,false,'','','',0,0,0,0,false,false,false)
   EmpStatusObjList: any;
   ClientId:number;
  constructor(private comApi: CommonService,
    private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService, private clientapi : ClientApiService) {
      setTheme('bs3');
      // this.maxDate.setDate(this.maxDate.getDate() + 7);
      // this.bsInlineRangeValue = [this.bsInlineValue, this.maxDate];
  
     
      this.comApi.getMaster(MasterType.ClientStatusActivity).subscribe((response) => {
        
        this.ActivityLst = response.data;
      });
  
      this.comApi.getMaster(MasterType.ClientStatusReferralCode).subscribe((response) => {
       
        this.ReferralCodeLst = response.data;
      });
      this.GetOfficeUserLst();
  
     }

  ngOnInit(): void {
    this.route.params.subscribe(
      (params : Params) =>{   
        this.ClientId = Number(params["clientId"]); 
      });
  }
  openModal(template: TemplateRef<any>) {
    
   this.modalRef = this.modalService.show(template);
 }
 
 decline(): void {
  
   this.modalRef?.hide();
 }

 onClickSubmit() {     

}



GetOfficeUserLst() {
 this.empApi.GetOfficeUserLst().subscribe((response) => {
   console.log(response.data);
   this.OfficeUser = response.data;      
 });
}







}
