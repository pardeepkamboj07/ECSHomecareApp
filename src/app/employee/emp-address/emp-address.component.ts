import { Component, OnInit,TemplateRef  } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { Incident } from '../../Model/Employee/incident';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';

import { AddressObj } from 'src/app/Model/Employee/address';
import { Router,ActivatedRoute, Params } from '@angular/router';

@Component({
  selector: 'app-emp-address',
  templateUrl: './emp-address.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './emp-address.component.scss']
})
export class EmpAddressComponent implements OnInit {
  modalRef?: BsModalRef;
  model = new AddressObj(0, 0, 1,  '', '','', '','', '','');
  constructor(
    private route:ActivatedRoute,
    private modalService: BsModalService, private empApi: EmployeeapiService) {
    setTheme('bs3');

   }

  ngOnInit(): void {

    this.route.params.subscribe(
      (params : Params) =>{
         this.model.empId = Number(params["eId"]);
         this.getAddress(this.model.empId);
      }
    );

  }


  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template);
  }
  
  decline(): void {
   
    this.modalRef?.hide();
  }

  saveAddress() {
    debugger;
    this.model.empId=Number(this.model.empId);
    this.model.addressType=1;
    const reqObj: AddressObj = this.model;
    console.log('Search', reqObj);
    this.empApi.saveAddress(reqObj).subscribe((response) => {
      this.decline();
      this.getAddress(reqObj.empId);
    });
  }

  
  getAddress(empId : number) {
    this.empApi.geAddress(empId).subscribe((response) => {
      if(response.result)
      {
        this.model = response.data;
      }
   
      console.log("Address   :"+ response.data);
    
    });
  }

}
