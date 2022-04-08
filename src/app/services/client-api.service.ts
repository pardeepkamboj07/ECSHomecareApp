import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { APIResponse } from '../models/APIResponse';
import { ClientModel } from 'src/app/models/client/client-model';
import{ClientStatusModel} from 'src/app/models/client/Status-model';
import{ClientStatusLst} from 'src/app/models/client/Status-model';
@Injectable({
  providedIn: 'root'
})
export class ClientApiService {

  constructor(private _http : HttpClient) { }


  addClient(clObj: ClientModel){ 
    debugger;
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Client/addClient", clObj,httpOptions);            
  }
  



  getClientDetail( userId : number)
  {
    return this._http.get<APIResponse<ClientModel>>(environment.domain + "/api/Client/getClientDetail" + '/' + userId);
  } 












 




  SaveClientStatus(_obj : ClientStatusModel){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post(environment.domain + "/api/Client/addStatus", _obj,httpOptions);   
              
  }

  getClientStatusList(clientId:number)
  {
    return this._http.get<APIResponse<ClientStatusLst>>(environment.domain + "/api/Client/getClientStatusList"+"/"+clientId);
  } 









}