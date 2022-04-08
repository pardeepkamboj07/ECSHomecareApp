import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { Employee } from 'src/app/models/Employee';
import { Observable } from 'rxjs';
import { APIResponse } from '../models/APIResponse';
import { Incident } from 'src/app/models/Employee/incident';
import { Attendance } from 'src/app/models/Employee/attendance';
import { Empstatus } from '../models/Employee/empstatus';
import { StatusSelectList } from 'src/app/models/status-select-list';
import { AddressObj } from 'src/app/models/Employee/address';
import { ComplianceObj } from 'src/app/models/Employee/compliance-obj';
import{EmpRate} from 'src/app/models/Employee/emp-rate'
import{SaveEmpDeclinedCase} from 'src/app/models/Employee/SaveEmpDeclinedCase';
import{EmpDeclineCaseList} from 'src/app/models/Employee/EmpDeclineCaseList';
import { EmployeeModel,EmployeeList } from 'src/app/models/Employee/employee-model';

@Injectable({
  providedIn: 'root'
})
export class EmployeeapiService {

  constructor(private _http : HttpClient) { }



  addEmployee(empObj: EmployeeModel){ 
    debugger;
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addEmployee", empObj,httpOptions);            
  }
  

  getEmployeeListObj()
  {
    return this._http.get<APIResponse<EmployeeList[]>>(environment.domain +"/api/Employee/getEmployeeListObj");
  } 
  
  getEmployeeInfo(empID : string)
  {
    return this._http.get<APIResponse<Employee>>(environment.domain + "/api/Employee/getemployeebyId/" + empID);
  } 

  deleteEmployee(empId : Number)
  {
    
    return this._http.get<APIResponse<string>>(environment.domain + "/api/Employee/deleteemployee/" + empId);
  } 


  saveIncident(_req : Incident){ 

    debugger;

    console.log(_req);
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addIncident", _req,httpOptions);            
  }


  getIncidentList(empId : number)
  {

    return this._http.get<APIResponse<Incident>>(environment.domain + "/api/Employee/getIncidentList" + '/' + empId);
  } 




  saveAttendance(_req : Attendance){ 

    debugger;

    console.log(_req);
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addAttendance", _req,httpOptions);            
  }


  getAttendanceList(empId : number)
  {

    return this._http.get<APIResponse<Incident>>(environment.domain + "/api/Employee/getAttendanceList" + '/' + empId);
  } 




  SaveEmployeeStatus(_obj : Empstatus){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addStatus", _obj,httpOptions);   
              
  }

  getEmpStatusList(empId:number)
  {
    return this._http.get<APIResponse<Empstatus>>(environment.domain + "/api/Employee/getEmpStatusList"+"/"+empId);
  } 

  GetOfficeUserLst()
  {
    return this._http.get<APIResponse<StatusSelectList>>(environment.domain + "/api/Employee/getOfficeUserList");
  } 

  GetTypeStatusLst()
  {
    return this._http.get<APIResponse<StatusSelectList>>(environment.domain + "/api/Employee/getTypeStatusList");
  } 

  GetEmployeeLst()
  {
    return this._http.get<APIResponse<StatusSelectList>>(environment.domain + "/api/Employee/getEmployeeStatusList");
  } 

  GetSchedulingLst()
  {
    return this._http.get<APIResponse<StatusSelectList>>(environment.domain + "/api/Employee/getScheduleLst");
  } 

  getAvailabilityList()
  {
    return this._http.get<APIResponse<any[]>>(environment.domain + "/api/Employee/getAvailabilityList");
  } 
  
  saveAddress(_req : AddressObj){ 

    debugger;
    console.log(_req);
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addAddress", _req,httpOptions);            
  }


  geAddress(empId : number)
  {

    return this._http.get<APIResponse<AddressObj>>(environment.domain + "/api/Employee/getAddress" + '/' + empId);
  } 

  saveCompliance(_req : ComplianceObj){ 

    debugger;
    console.log(_req);
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addCompliance", _req,httpOptions);            
  }


  geComplianceList(empId : number)
  {

    return this._http.get<APIResponse<ComplianceObj[]>>(environment.domain + "/api/Employee/getComplianceList" + '/' + empId);
  } 



  SaveEmployeeRate(_obj : EmpRate){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addRate", _obj,httpOptions);   
              
  }

  GetEmployeeRateLst(empId:number)
  {
    return this._http.get<APIResponse<StatusSelectList>>(environment.domain + "/api/Employee/getEmpRate"+ '/' + empId);
  } 
  

  SaveEmpDeclinedCase(_obj : SaveEmpDeclinedCase){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addEmpDeclinedCase", _obj,httpOptions);   
              
  }

  GetEmpDeclinedCase(empId:number)
  {
    debugger
    return this._http.get<APIResponse<object>>(environment.domain + "/api/Employee/getEmpDeclinedcase"+ '/' + empId);
  } 

  UploadFile(formData:FormData)
  {
    debugger
    var headers_object = new HttpHeaders();  
    headers_object.append('Content-Type', 'text/plain;charset=UTF-8');  
    var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
    const httpOptions = {
      headers: headers_object
    }; 
    return this._http.post(environment.domain + "/api/Common/UploadFile", formData,{reportProgress: true, observe: 'events'},);  
  
     
  }



  
}