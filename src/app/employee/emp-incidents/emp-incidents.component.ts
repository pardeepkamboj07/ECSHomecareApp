import { Component, OnInit,TemplateRef  } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { Incident } from '../../Model/Employee/incident';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { ClientApiService } from 'src/app/Service/client-api.service';
import { ItemsList } from 'src/app/Model/common';
import { Router,ActivatedRoute, Params } from '@angular/router';
@Component({
  selector: 'app-emp-incidents',
  templateUrl: './emp-incidents.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './emp-incidents.component.scss',
  ]
})
export class EmpIncidentsComponent implements OnInit {
  modalRef?: BsModalRef;
  config = {
    animated: true,
    keyboard: true,
    backdrop: true,
    ignoreBackdropClick: false,
    class: "my-modal"
  };
  model = new Incident(0, 0, 0,  '', '');

  ClientList = Array<ItemsList>();
  incidentObjList: any;
  // bsInlineValue = new Date();
  // ;
  // maxDate = new Date();
  constructor(
    private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService, private clientapi : ClientApiService) {
    setTheme('bs3');
    // this.maxDate.setDate(this.maxDate.getDate() + 7);
    // this.bsInlineRangeValue = [this.bsInlineValue, this.maxDate];
   }

  ngOnInit(): void {
      
debugger;
    this.route.params.subscribe(
      (params : Params) =>{
         this.model.empId = Number(params["eId"]);
         this.getIncidentList(this.model.empId);
      }
    );


    this. BindClientList();
   
  }

  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template);
  }
  
  decline(): void {
   
    this.modalRef?.hide();
  }

  saveIncident() {
    // debugger;
    this.model.clientId=Number(this.model.clientId);
    const reqObj: Incident = this.model;
    console.log('Search', reqObj);
    this.empApi.saveIncident(reqObj).subscribe((response) => {
      this.decline();
      this.getIncidentList(reqObj.empId);
    });
  }

  BindClientList() {
    // this.IsLoad = true;
    debugger;
    this.clientapi.getClientList().subscribe(response => {
      debugger;
      response.data.forEach((_obj: any) => {
        this.ClientList.push(
          new ItemsList(_obj.clientId.toString(), _obj.clientName)
        );
      });
    });
  }

  getIncidentList(empId : number) {
    this.empApi.getIncidentList(empId).subscribe((response) => {
      this.incidentObjList = response.data;

      console.log(response);
    });
  }


 
  




}
