import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { ClientApiService } from 'src/app/Service/client-api.service';
import { ItemsList } from 'src/app/Model/common';
import { Router,ActivatedRoute, Params } from '@angular/router';
import{SaveEmpDeclinedCase} from 'src/app/Model/Employee/SaveEmpDeclinedCase';

@Component({
  selector: 'app-emp-declined-cases',
  templateUrl: './emp-declined-cases.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',    
    './emp-declined-cases.component.scss']
})
export class EmpDeclinedCasesComponent implements OnInit {
  modalRef?: BsModalRef;
  ClientList :any;
  EmpCaseObj:any;  
  CaseTypeobj:any;
 EmpId:number;
 ClientId:number;
 model=new SaveEmpDeclinedCase("",0,0,"","","",0,0,"","",0);
  constructor(private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService, private clientapi : ClientApiService) { }

  ngOnInit(): void {
    debugger
    this.route.params.subscribe(
      (params : Params) =>{
         this.EmpId = Number(params["eId"]);

         this.GetCaseList(this.EmpId);

      }
    );
   
  }

  openModal(template: TemplateRef<any>) {
    this.BindClientList();
   
   this.modalRef = this.modalService.show(template);
 }

 decline(): void {
   
  this.modalRef?.hide();
}

 BindClientList() {
  
  this.clientapi.getClientList().subscribe(response => {    
    this.ClientList = response.data;  
  });
}

onClickSubmit() { 
 
   this.model.AssignmentStart=this.model.AssignmentStart;
   this.model.Casetypeid=Number(this.model.Casetypeid);
   this.model.clientId=Number(this.model.clientId);
   this.model.Day=Number(this.model.Day);
   this.model.week=Number(this.model.week);
   this.model.RepotedDate=this.model.RepotedDate;
   this.model.DeclineReason=this.model.DeclineReason;  
   this.model.Note=this.model.Note; 
   this.model.empId=this.EmpId; 
 

   this.empApi.SaveEmpDeclinedCase(this.model).subscribe((response) => {
      debugger
    this.empApi.GetEmployeeRateLst(0);  
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

