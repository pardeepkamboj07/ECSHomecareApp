import { Component, OnInit,TemplateRef  } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { ClientApiService } from 'src/app/Service/client-api.service';

import { Router,ActivatedRoute, Params } from '@angular/router';
import{Empstatus} from 'src/app/Model/Employee/empstatus';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType} from 'src/app/Model/common';
@Component({
  selector: 'app-emp-status',
  templateUrl: './emp-status.component.html',
  styleUrls: ['../../../assets/css/orange-blue.css','./emp-status.component.scss']
})

export class EmpStatusComponent implements OnInit {

  EmplList = Array<ItemsList>(); 
  TypeStatusList: ItemsList[] = [];
  OfficeUser:any;
  
  ScheduleLst :any;
  modalRef?: BsModalRef;
   model = new Empstatus('',false,false,'','','',0,0,0,0,false,false,false)
   EmpStatusObjList: any;
  constructor(
    private comApi: CommonService,
    private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService, private clientapi : ClientApiService) {
    setTheme('bs3');
    // this.maxDate.setDate(this.maxDate.getDate() + 7);
    // this.bsInlineRangeValue = [this.bsInlineValue, this.maxDate];

    this.comApi.getEmpList().subscribe((response) => {
      if(response.result)
      {
      
        this.EmplList = response.data;
      }
    });

    this.comApi.getMaster(MasterType.EmpStatusType).subscribe((response) => {
      this.TypeStatusList = response.data;
    });




   }

   EmpId:number;
  ngOnInit(): void {
    this.route.params.subscribe(
      (params : Params) =>{   
        this.EmpId = Number(params["empId"]);   
     
         this.getEmployeeStatusLst(this.EmpId);
         
      });
   
  }

  openModal(template: TemplateRef<any>) {
     this.GetOfficeUserLst();

  
     this.GetSchedulingLst();
    this.modalRef = this.modalService.show(template);
  }
  
  decline(): void {
   
    this.modalRef?.hide();
  }

  onClickSubmit() {     
    this.model.officeUserId=Number(this.model.officeUserId);
    this.model.scheduling=Number(this.model.scheduling);
    this.model.employeeId=Number(this.model.employeeId);
    this.model.typeStatusId=Number(this.model.typeStatusId);
    this.model.text=Boolean(this.model.text);
    this.model.screen=Boolean(this.model.screen);
    this.model.email=Boolean(this.model.email);
    this.model.rehire=Boolean(this.model.rehire);
    this.model.resume=Boolean(this.model.resume);    
    this.empApi.SaveEmployeeStatus(this.model).subscribe((response) => {
      // this.modalRef?.hide();
      this.decline();   
      this.getEmployeeStatusLst(this.EmpId);
      
     
    }); 
 }

 getEmployeeStatusLst(empid:number) {
  this.empApi.getEmpStatusList(empid).subscribe((response) => {
    this.EmpStatusObjList = response.data;      
  });
}

GetOfficeUserLst() {
  this.empApi.GetOfficeUserLst().subscribe((response) => {
    this.OfficeUser = response.data;      
  });
}





GetSchedulingLst() {
  this.empApi.GetSchedulingLst().subscribe((response) => {
    this.ScheduleLst = response.data;      
  });
}



  

}
