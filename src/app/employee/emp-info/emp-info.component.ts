import { Component, OnInit,ViewChild,TemplateRef  } from '@angular/core';
import { EmployeeapiService } from 'src/app/services/employeeapi.service'; 
import { Employee } from 'src/app/models/employee';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { DatePipe } from '@angular/common';

import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { TabsetComponent } from 'ngx-bootstrap/tabs';
import { setTheme } from 'ngx-bootstrap/utils';

@Component({
  selector: 'app-emp-info',
  templateUrl: './emp-info.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './emp-info.component.scss']
})
export class EmpInfoComponent implements OnInit {
  modalRef?: BsModalRef;
  UserData:any;
  config = {
    animated: true,
    keyboard: true,
    backdrop: true,
    ignoreBackdropClick: false,
    class: "my-modal"
  };
  empObj :any;
  empId : string = "-1";
  empInfo : Employee;
  Etype : string = "";
  EmpName : string = "";
  EAddress : string = "";
  ECellPhone : string = "";
  EEmail : string = "";
  empStatus: string;
  currentDate  = new Date();
  constructor(private router:Router, 
    private route:ActivatedRoute,
    public datepipe: DatePipe,
    private empapi : EmployeeapiService,    
    private modalService: BsModalService   
    ) 
    {
      setTheme('bs3');
    }

    @ViewChild('staticTabs', { static: false }) staticTabs?: TabsetComponent;

    selectTab(tabId: number) {
      if (this.staticTabs?.tabs[tabId]) {
        this.staticTabs.tabs[tabId].active = true;
      }
    }

  ngOnInit(): void {
    this.route.params
    .subscribe(
      (params : Params) =>{
        this.empId = params["empId"];
        this.UserData={
          id:this.empId,
          type:'Emp Type'
        };
      }
    );
    this.empInfo = new Employee();
    this.GetEmployeeInfo(this.empId);
  }


  GetEmployeeInfo(empId : string)
  {
    this.empapi.getEmployeeInfo(empId).subscribe(response => {
          this.empInfo = response.data;
          console.log(this.empInfo);
          this.Etype = this.empInfo.types;
          this.EmpName = this.getName(this.empInfo);
          this.empStatus = this.empInfo.status;
        }); 
  }

  getName(empInfo : Employee) : string
  {
    if(empInfo.lastName.length > 1)
    {
      return this.empInfo.lastName + ',' + this.empInfo.firstName;
    }
    else
    {
      return this.empInfo.firstName;
    }
  }
  formatPhoneNumber(phoneNumberString:string) {
    var cleaned = ('' + phoneNumberString).replace(/\D/g, '');
    var match = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/);
    if (match) {
      return '(' + match[1] + ') ' + match[2] + '-' + match[3];
    }
    return phoneNumberString;
  }



}
