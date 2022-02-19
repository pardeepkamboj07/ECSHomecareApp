import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { APIResponse } from 'src/app/Model/APIResponse';

@Injectable({
  providedIn: 'root'
})
export class LoginapiService {

  constructor(private _http : HttpClient) { }

  validateuserlogininfo(uname : string, pwd : string)
  {
    return this._http.get<APIResponse<any>>(environment.domain + environment.loginurl + uname + "/" + pwd);            
  } 
}
