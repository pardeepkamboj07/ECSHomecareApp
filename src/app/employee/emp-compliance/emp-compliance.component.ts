import { Component, OnInit,TemplateRef  } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { ItemsList } from 'src/app/Model/common';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { ComplianceObj } from 'src/app/Model/Employee/compliance-obj';
import { Router,ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-emp-compliance',
  templateUrl: './emp-compliance.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './emp-compliance.component.scss']
})
export class EmpComplianceComponent implements OnInit {


  modalRef?: BsModalRef;
  model = new ComplianceObj(0, 0, -1,  '', '','', '','', '');
  EmplList = Array<ItemsList>(); 

  complianceObjList: any;
  constructor(
    private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService) {
    setTheme('bs3');

   }


   ngOnInit(): void {
    this.BindEmpList();
    this.route.params.subscribe(
      (params : Params) =>{
         this.model.empId = Number(params["eId"]);
         this.getCompliance(this.model.empId);
      }
    );

  }

  BindEmpList() {
   
    debugger;
    this.empApi.getEmployeeList().subscribe(response => {
      debugger;
      response.data.forEach((_obj: any) => {
        this.EmplList.push(
          new ItemsList(_obj.empID.toString(), _obj.empName)
        );
      });
    });
  }





  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template);
  }
  
  decline(): void {
   
    this.modalRef?.hide();
  }

  saveCompliance() {
    debugger;
    this.model.empId=Number(this.model.empId);
    this.model.nurse=Number(this.model.nurse);
    const reqObj: ComplianceObj = this.model;
    console.log('Search', reqObj);
    this.empApi.saveCompliance(reqObj).subscribe((response) => {
      this.decline();
      this.getCompliance(reqObj.empId);
    });
  }

  
  getCompliance(empId : number) {
    this.empApi.geComplianceList(empId).subscribe((response) => {
      this.complianceObjList = response.data;

      console.log(response);
    });
  }



}
