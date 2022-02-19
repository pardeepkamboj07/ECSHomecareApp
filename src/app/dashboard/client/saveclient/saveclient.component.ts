import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ClientApiService } from 'src/app/Service/client-api.service'; 
import { Client } from 'src/app/Model/Client';
import { Router } from '@angular/router';

@Component({
  selector: 'app-saveclient',
  templateUrl: './saveclient.component.html',
  styleUrls: [
    '../../../../assets/css/orange-blue.css',    
    './saveclient.component.scss']
})
export class SaveclientComponent implements OnInit {

  clientInfo: Client = new Client("", "");
  isActive : Boolean = true;
  validBillTo : boolean = true;
  validFName : boolean = true;
  validLName : boolean = true;
  validCPhone : boolean = true;
  validInsID : boolean = true;
  validSSN : boolean = true;
  validClientID : boolean = true;
  validGender : boolean = true; 
  validClassCord : boolean = true;
  validCity : boolean = true;
  validCountry : boolean = true;
  validState : boolean = true;
  validZipCode : boolean = true;
  validRefID : boolean = true;
  validEmgContact : boolean = true;
  gender : string = "";
  classc : string = "";
  state : string = "";
  validCWPhone : boolean = true;
  validCWEmail : boolean = true;

  constructor(private router:Router,private clientapi : ClientApiService) { }

  ngOnInit(): void {
  }
  
  IsActiveCB(event : any)
  {
    this.isActive = !this.isActive;
    if(this.isActive)
    this.clientInfo.isActive = 1;
    else
    this.clientInfo.isActive = 0;
  }

  getNurse(nurse : any)
  {
    this.clientInfo.nurse = nurse;
  }

  getcordinator(cvalue : any)
  {
    this.classc = cvalue;
    this.clientInfo.classCordinator = cvalue;
  }

  getmarital(mstatus : any)
  {
    this.clientInfo.maritalStatus = mstatus;
  }

  getstate(state : any)
  {
    this.state = state;
    this.clientInfo.cState = state;
  }

  FilterGender(gender : any)
  {
    this.gender = gender;
    this.clientInfo.gender = gender;
  }

  OnSubmit(form : NgForm)
  {
    if(form.value["txtBill"].length > 2)
    {
      this.validBillTo = true;
      if(form.value["txtfirstname"].length > 2)
      {
        this.validFName = true;
        if(form.value["txtlastname"].length > 2)
        {
          this.validLName = true;
          if(form.value["txtCPhone"].length == 10)
          {
            this.validCPhone = true;
            if(form.value["txtInsID"].length > 2)
            {
              this.validInsID = true;
              if(form.value["txtSSN"].length > 2)
              {
                this.validSSN = true;
                if(form.value["txtClientID"].length > 2)
                {
                  this.validClientID = true;
                  if(this.gender.length > 0)
                  {
                    this.validGender = true;  
                    if(true)
                    {
                      this.validClassCord = true;    
                      if(form.value["txtCity"].length > 2)
                      {
                        this.validCity = true;      
                        if(form.value["txtCountry"].length > 2)
                        {
                          this.validCountry = true;
                          if(true)
                          {
                            this.validState = true;  
                            if(form.value["txtZCode"].length > 2)
                            {
                              this.validZipCode = true;    
                              if(form.value["txtRefId"].length > 2)
                              {
                                this.validRefID = true;    
                                if(form.value["txtEmgContact"].length == 10)
                                {
                                  this.validEmgContact = true;      
                                  if(form.value["txtCaseWPhone"].length == 10)
                                  {
                                    this.validCWPhone = true;      
                                    if(form.value["txtWEmail"].length > 3)
                                    {
                                      this.validCWEmail = true;  
                                      this.SaveClientInfo(form);    
                                    }
                                    else
                                    {
                                      this.validCWEmail = false;      
                                    }
                                  }
                                  else
                                  {
                                    this.validCWPhone = false;      
                                  }
                                }
                                else
                                {
                                  this.validEmgContact = false;      
                                }
                              }
                              else
                              {
                                this.validRefID = false;      
                              }
                            }
                            else
                            {
                              this.validZipCode = false;    
                            }
                          }
                          else
                          {
                            this.validState = false;    
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
                      this.validClassCord = false;      
                    }
                  }
                  else
                  {
                    this.validGender = false;    
                  }
                }
                else
                {
                  this.validClientID = false;  
                }
              }
              else
              {
                this.validSSN = false;
              }
            }
            else
            {
              this.validInsID = false;
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
      this.validBillTo = false;
    }
  }

  SaveEmp()
  {
    this.router.navigate(['/dashboard/saveemployee'])
  }

  SaveClientInfo(form : NgForm)
  {
    this.clientInfo.billTo = form.value["txtBill"];
    this.clientInfo.caseWorkerEmail = form.value["txtWEmail"];
    this.clientInfo.caseWorkerPhone = form.value["txtCaseWPhone"];
    this.clientInfo.cellPhone = form.value["txtCPhone"];
    this.clientInfo.city = form.value["txtCity"];
    
    this.clientInfo.country = form.value["txtCountry"];
    this.clientInfo.email = form.value["txtEmail"];
    this.clientInfo.emgContact = form.value["txtEmgContact"];
    this.clientInfo.ethnicity = form.value["txtEthnicity"];
    this.clientInfo.extClientId = form.value["txtClientID"];
    this.clientInfo.firstName = form.value["txtfirstname"];
    
    this.clientInfo.insurenceId = form.value["txtInsID"];
    this.clientInfo.lastName = form.value["txtlastname"];
    
    this.clientInfo.middleName = form.value["txtmiddlename"];
    
    this.clientInfo.ofChild = form.value["txtChild"];
    this.clientInfo.referredBy = form.value["txtRefId"];
    this.clientInfo.sSN = form.value["txtSSN"];
    this.clientInfo.zipCode = form.value["txtZCode"];
    console.log(this.clientInfo);
      this.clientapi.saveclientinfo(this.clientInfo).subscribe(
        (response)=>
        {
          this.router.navigate(['/Layout/clientlist'])
        },
        (error)=> {
          console.log(error);
        }
        )      

  }

}
