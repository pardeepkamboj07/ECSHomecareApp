import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { EmployeeModel } from 'src/app/Model/Employee/employee-model';
import { Router } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType ,SelectList} from 'src/app/Model/common';
@Component({
  selector: 'app-new-employee',
  templateUrl: './new-employee.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './new-employee.component.scss']
})
export class NewEmployeeComponent implements OnInit {

  IsLoad: boolean = false;
  model = new EmployeeModel();
  statusData: ItemsList[] = [];
  marriedStatusData: ItemsList[] = [];
  genderData: ItemsList[] = [];
  ethnicityData: ItemsList[] = [];
  empTypeList = Array<ItemsList>();
  empList = Array<ItemsList>();
  countryData: SelectList[] = [];
  stateData: SelectList[] = [];

  constructor(private router:Router, private empApi : EmployeeapiService,
    private comApi: CommonService) {
    
      this.BindMaster();

      this. model.empStatus=1;
      this. model.enthnicity=1;
      this. model.gender=1;
      this. model.maritalStatus=1;

      this. model.country='';
      this. model.taxState='';
     }

  ngOnInit(): void {
  }

  OnChangeCountry(e: any): void {
    this.comApi.getStateList(e.target.value).subscribe((response) => {
      this.stateData = response.data;
    });
  }

  BindMaster()
  {
    this.comApi.getMaster(MasterType.Status).subscribe((response) => {
      this.statusData = response.data;
    });
    this.comApi.getMaster(MasterType.MaritalStatus).subscribe((response) => {
      this.marriedStatusData = response.data;
    });
    this.comApi.getMaster(MasterType.Gender).subscribe((response) => {
      this.genderData = response.data;
    });
    this.comApi.getMaster(MasterType.Ethnicity).subscribe((response) => {
      this.ethnicityData = response.data;
    });
    this.comApi.getCountryList().subscribe((response) => {
      this.countryData = response.data;
    });
    this.comApi.getEmpTypeList().subscribe((response) => {
      this.empTypeList = response.data;
    });
    this.comApi.getEmpList().subscribe((response) => {
      this.empList = response.data;
    });

  }



  saveChanges() {

    debugger;
    this.IsLoad = true;
    this.model.empStatus=Number(this.model.empStatus);
    this.model.empType=Number(this.model.empType);
    this.model.enthnicity=Number(this.model.enthnicity);
    this.model.gender=Number(this.model.gender);
    this.model.maritalStatus=Number(this.model.maritalStatus);

    const empObj: EmployeeModel = this.model;
    this.empApi.addEmployee(empObj).subscribe((response) => {
      this.IsLoad = false;
      console.log('Stock change Response: ', response);
    });
  }





}
