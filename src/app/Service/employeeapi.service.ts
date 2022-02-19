import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { Employee } from 'src/app/Model/Employee';
import { Observable } from 'rxjs';
import { APIResponse } from '../Model/APIResponse';

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
  
}
