import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service'; 
import { Employee } from 'src/app/Model/Employee';
import { Router } from '@angular/router';

@Component({
  selector: 'app-saveemployee',
  templateUrl: './saveemployee.component.html',
  styleUrls: [
    '../../../../assets/css/orange-blue.css',
    
    './saveemployee.component.scss']
})
export class SaveemployeeComponent implements OnInit {
  title = 'New Employee';
  empinfo: Employee = new Employee;
  isActive : Boolean = true;
  dateHire : string = "";
  dateFCase : string = "";
  dateDOB : string = "";
  validSSN : boolean = true;
  validFName : boolean = true;
  validLName : boolean = true;
  validCPhone : boolean = true;
  validHPhone : boolean = true;
  validEmail : boolean = true;
  validDOB : boolean = true;
  validEmpID : boolean = true;
  hrsup : string = "";
  validHRSupervisor : boolean = true;
  validCity : boolean = true;
  validCountry : boolean = true;
  validZipCode : boolean = true;
  validEmgPhone : boolean = true;
  validEmgContact : boolean = true;

  constructor(private router:Router, private empapi : EmployeeapiService) { }

  ngOnInit(): void {
  }

  IsActiveCB(event : any)
  {
    if(event == "1")
    this.empinfo.isActive = 1;
    else
    this.empinfo.isActive = 0;
  }

  FilterEthinicity(eth : any)
  {
    this.empinfo.enthnicity = eth;
  }

  FilterHR(cvalue : any)
  {
    this.hrsup = cvalue;
    this.empinfo.hRSupervisor = cvalue;
  }

  getmarital(mstatus : any)
  {
    this.empinfo.maritalStatus = mstatus;
  }

  getstate(state : any)
  {
    this.empinfo.cState = state;
  }

  FilterGender(gender : any)
  {
    this.empinfo.gender = gender;
  }

  onHireDateChange(dhire : any)
  {
    this.dateHire = dhire;
  }

  onFCaseDateChange(dfcase : any)
  {
    this.dateFCase = dfcase;
  }

  onDOBDateChange(ddob : any)
  {
    this.dateDOB = ddob;
  }

  OnSubmit(form : NgForm)
  {
    //alert("Test");
    if(form.value["txtSSN"].length > 3)
    {
      this.validSSN = true;
      if(form.value["txtfirstname"].length > 2)
      {
        this.validFName = true;
          if(form.value["txtlastname"].length > 2)
          {
             this.validLName = true;
            if(form.value["txtCPhone"].length == 10)
            {
              this.validCPhone = true;
              if(form.value["txtHPhone"].length == 10)
              {
                this.validHPhone = true;
                if(form.value["txtEmail"].length > 3)
                {
                  this.validEmail = true;
                  if(this.dateDOB.length > 6)
                  {
                    this.validDOB = true;
                    if(form.value["txtEmpId"].length > 2)
                    {
                      this.validEmpID = true;
                      if(this.hrsup.length > 2)
                      {
                        this.validHRSupervisor = true;
                        if(form.value["txtCity"].length > 2)
                        {
                          this.validCity = true;
                          if(form.value["txtCountry"].length > 2)
                          { 
                            this.validCountry = true;
                            if(form.value["txtZCode"].length > 4)
                            {
                              this.validZipCode = true;
                              if(form.value["txtEmgPhone"].length == 10)
                              {
                                this.validEmgPhone = true;
                                if(form.value["txtEmgCPhone"].length == 10)
                                {
                                  this.validEmgContact = true;
                                  this.saveemployeeinfo(form);
                                }
                                else
                                {
                                  this.validEmgContact = false;
                                }
                              }
                              else
                              {
                                this.validEmgPhone = false;
                              }
                            }
                            else
                            {
                              this.validZipCode = false;
                            }
                          }
                          else
                          {
                            this.validCountry = false;
                          }
                        }
                        else
                        {
                          this.validCity = false;
                        }
                      }
                      else
                      {
                        this.validHRSupervisor = false;
                      }
                    }
                    else
                    {
                      this.validEmpID = false;
                    }
                  }
                  else
                  {
                    this.validDOB = false;
                  }
                }
                else
                {
                  this.validEmail = false;
                }
              }
              else
              {
                this.validHPhone = false;
              }
            }
            else
            {
              this.validCPhone = false;
            }
          }
          else
          {
            this.validLName = false;
          }
      }
      else
      {
        this.validFName = false;
      }
    }
    else
    {
      this.validSSN = false;
    }
  }

  saveemployeeinfo(form : NgForm)
  {
    this.empinfo.emgContact = form.value["txtEmgCPhone"];
    this.empinfo.emgPhone = form.value["txtEmgPhone"];
    this.empinfo.cellPhone = form.value["txtCPhone"];
    this.empinfo.city = form.value["txtCity"];
    
    this.empinfo.country = form.value["txtCountry"];
    this.empinfo.email = form.value["txtEmail"];
    
    this.empinfo.extEmpId = form.value["txtEmpId"];
    this.empinfo.firstName = form.value["txtfirstname"];
    
    this.empinfo.dOB = this.dateDOB;
    this.empinfo.lastName = form.value["txtlastname"];
    
    this.empinfo.middleName = form.value["txtmiddlename"];
    this.empinfo.dateOfHire = this.dateHire;
    this.empinfo.dateOfFirstCase = this.dateFCase;
    this.empinfo.referredBy = form.value["txtRefId"];
    this.empinfo.sSN = form.value["txtSSN"];
    this.empinfo.zipCode = form.value["txtZCode"];
    if(this.empinfo.cState == '')
      this.empinfo.cState = 'Washington';
    if(this.empinfo.enthnicity == '')
      this.empinfo.enthnicity = 'Volvo';
    if(this.empinfo.gender == '')
      this.empinfo.gender = 'M';
    if(this.empinfo.hRSupervisor == '')
      this.empinfo.hRSupervisor = 'Volvo';

      this.empapi.savenweemployeeinfo(this.empinfo).subscribe(
        (response)=>
        {
          this.router.navigate(['/employeeList'])
        },
        (error)=> {
          console.log(error);
        }
        )      
  }

  SaveClient()
  {
    this.router.navigate(['/dashboard/saveclient'])
  }

}
