import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { Employee } from 'src/app/Model/Employee';
import { Observable } from 'rxjs';
import { APIResponse } from '../Model/APIResponse';
import { Incident } from 'src/app/Model/Employee/incident';
import { Attendance } from 'src/app/Model/Employee/attendance';
import { Empstatus } from '../Model/Employee/empstatus';
@Injectable({
  providedIn: 'root'
})
export class EmployeeapiService {

  constructor(private _http : HttpClient) { }

  savenweemployeeinfo(cInfo : Employee){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + environment.saveempurl, cInfo,httpOptions);            
  }

  getEmployeeList()
  {
    return this._http.get<APIResponse<Employee[]>>(environment.domain + environment.getempurl);
  } 

  getEmployeeInfo(empID : string)
  {
    return this._http.get<APIResponse<Employee>>(environment.domain + environment.getempbyidurl + '/' + empID);
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
    alert("Call Api Service")
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "​/api​/Employee​/addStatus", _obj,httpOptions);            
  }


  
}
