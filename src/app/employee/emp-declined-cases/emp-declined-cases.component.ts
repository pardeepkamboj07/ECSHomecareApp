import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { EmployeeapiService } from 'src/app/services/employeeapi.service';
import { ClientApiService } from 'src/app/services/client-api.service';
import { ItemsList } from 'src/app/models/common';
import { Router,ActivatedRoute, Params } from '@angular/router';
import{SaveEmpDeclinedCase} from 'src/app/models/employee/saveEmpDeclinedCase';
import { CommonService } from 'src/app/services/common.service';
@Component({
  selector: 'app-emp-declined-cases',
  templateUrl: './emp-declined-cases.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',    
    './emp-declined-cases.component.scss']
})
export class EmpDeclinedCasesComponent implements OnInit {
  modalRef?: BsModalRef;
  ClientList = Array<ItemsList>(); 
  EmpCaseObj:any;  
  CaseTypeobj:any;
 EmpId:number;
 ClientId:number;
 model=new SaveEmpDeclinedCase("",0,0,"","","",0,0,"","",0);
  constructor(
    private comApi: CommonService,
    private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService, private clientapi : ClientApiService) { 



      this.comApi.getClientList().subscribe((response) => {
        if(response.result)
        {
          debugger;
          this.ClientList = response.data;
        }
      });
  
  

    }

  ngOnInit(): void {
    debugger
    this.route.params.subscribe(
      (params : Params) =>{
         this.EmpId = Number(params["empId"]);

         this.GetCaseList(this.EmpId);

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
 
   this.model.assignmentStart=this.model.assignmentStart;
   this.model.casetypeId=Number(this.model.casetypeId);
   this.model.clientId=Number(this.model.clientId);
   this.model.day=Number(this.model.day);
   this.model.week=Number(this.model.week);
   this.model.repotedDate=this.model.repotedDate;
   this.model.declineReason=this.model.declineReason;  
   this.model.note=this.model.note; 
   this.model.empId=this.EmpId; 

   this.empApi.SaveEmpDeclinedCase(this.model).subscribe((response) => {

    this.GetCaseList(this.EmpId);  
  this.decline();

 }); 
 }




GetCaseList(empId : number) {
  
this.empApi.GetEmpDeclinedCase(empId).subscribe((response) => {
    this.EmpCaseObj = response.data;

    console.log(response);
  });
}

}

