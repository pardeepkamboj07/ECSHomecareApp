import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { Employee } from 'src/app/Model/Employee';
import { Observable } from 'rxjs';
import { APIResponse } from '../Model/APIResponse';
import { Incident } from 'src/app/Model/Employee/incident';
import { Attendance } from 'src/app/Model/Employee/attendance';
import { Empstatus } from '../Model/Employee/empstatus';
import { StatusSelectList } from 'src/app/Model/status-select-list';
import { AddressObj } from 'src/app/Model/Employee/address';
import { ComplianceObj } from 'src/app/Model/Employee/compliance-obj';
import{EmpRate} from 'src/app/Model/Employee/emp-rate'
import{SaveEmpDeclinedCase} from 'src/app/Model/Employee/SaveEmpDeclinedCase';
import{EmpDeclineCaseList} from 'src/app/Model/Employee/EmpDeclineCaseList';
import { EmployeeModel,EmployeeList } from 'src/app/Model/Employee/employee-model';

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






  savenweemployeeinfo(cInfo : Employee){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Employee/addEmployee", cInfo,httpOptions);            
  }


  

  getEmployeeList()
  {
    return this._http.get<APIResponse<Employee[]>>(environment.domain + environment.getempurl);
  } 

  getEmployeeInfo(empID : string)
  {
    return this._http.get<APIResponse<Employee>>(environment.domain + "/api/Employee/getemployeebyId/" + empID);
  } 

  deleteEmployee(empId : Number)
  {
    return this._http.get<APIResponse<string>>(environment.domain + environment.deleteemployeeurl + empId);
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

  getEmpStatusList()
  {
    return this._http.get<APIResponse<Empstatus>>(environment.domain + "/api/Employee/getEmpStatusList");
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

  
}
