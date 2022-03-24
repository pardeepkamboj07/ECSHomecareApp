import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { EmployeeapiService } from 'src/app/Service/employeeapi.service';

import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType ,SelectList} from 'src/app/Model/common';
import { EmployeeList } from 'src/app/Model/Employee/employee-model';
@Component({
  selector: 'app-emp-list',
  templateUrl: './emp-list.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    
    './emp-list.component.scss']
})
export class EmpListComponent implements OnInit {
  IsLoad: boolean = false;
  statusData: ItemsList[] = [];
  empTypeList: ItemsList[] = [];
  searchValue = "";
  managerList: ItemsList[];
  empList: EmployeeList[];
  currentList: EmployeeList[];
  public currentAlpha:string="All";

  constructor(private router: Router, private empapi: EmployeeapiService, private comApi: CommonService) {
    this.BindEmployee();
  }

  ngOnInit(): void {
  
  }

  BindEmployee()
  {
     this.IsLoad = true;
    this.empapi.getEmployeeListObj().subscribe(response => {
      this.empList=this.currentList=  response.data;
      this.IsLoad = false;
    });

    this.comApi.getMaster(MasterType.Status).subscribe((response) => {
      this.statusData = response.data;
    });
	
	 this.comApi.getEmpTypeList().subscribe((response) => {
      this.empTypeList = response.data;
    });

    this.comApi.getEmpList().subscribe((response) => {
      this.managerList = response.data;
    });

  }

  OnChangeType(type: any) {
   debugger;
    if (type == '0') {
      this.empList = this.currentList;
    }
    else {
      var result = this.currentList.filter(o => o.typeId == type);
      this.empList = result;
    }
  }

  OnChangeStatus(_status: any) {
    debugger;
     if (_status == '0') {
       this.empList = this.currentList;
     }
     else {
       var result = this.currentList.filter(o => o.empStatus == _status);
       this.empList = result;
     }
 
   }
   OnChangeManager(_md: any) {
    debugger;
     if (_md == '0') {
       this.empList = this.currentList;
     }
     else {
       var result = this.currentList.filter(o => o.managerId == _md);
       this.empList = result;
     }
 
   }
   



  AlphaFilter(alpha:any){
    this.currentAlpha=alpha;
    if (alpha == 'All') {
      this.empList = this.currentList;
    }
    else {
      var result = this.currentList.
       filter(o => o.empName
      .substring(0,1).toLowerCase()===alpha.toLowerCase());

      this.empList = result;
    }

  }


  delEmployee(params: any) {
    
    this.empapi.deleteEmployee(params.empID).subscribe(response => {

      let remaining = this.currentList.filter(
        (res: any) => res.empID != params.empID
      );      
      this.currentList= remaining;
      this.empList = this.currentList;
    });
  }












}
