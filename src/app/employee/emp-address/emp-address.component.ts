import { Component, OnInit,TemplateRef  } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { Incident } from 'src/app/models/employee/incident';
import { AccountService } from 'src/app/services/account.service';
import { EmployeeapiService } from 'src/app/services/employeeapi.service';
import { AddressObj } from 'src/app/models/employee/address';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { UserModel } from 'src/app/models/account/login-model';
import { AddressType } from 'src/app/models/common';

@Component({
  selector: 'app-emp-address',
  templateUrl: './emp-address.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './emp-address.component.scss']
})
export class EmpAddressComponent implements OnInit {
  modalRef?: BsModalRef;
  currentUser:UserModel;
  model = new AddressObj(0, 0, 1,  '', '','', '','', '','');
  constructor(
    private route:ActivatedRoute,
    private modalService: BsModalService, 
    private accountApi: AccountService,
    private empApi: EmployeeapiService) {
    setTheme('bs3');
    this.currentUser=this.accountApi.getCurrentUser();
   }

  ngOnInit(): void {

    this.route.params.subscribe(
      (params : Params) =>{


        if(params["empId"]!=null)
        {
          this.model.empId = Number(params["empId"]);
        }
        else
        {
          this.model.empId = Number(params["clientId"]);
        }
        
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
    this.model.userId=Number(this.model.empId);
    this.model.addressType=AddressType.Permanent;  
    this.model.createdBy=this.currentUser.userId;
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
