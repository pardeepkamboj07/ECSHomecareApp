import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';
import { APIResponse } from '../Model/APIResponse';
import { ItemsList } from 'src/app/Model/common';

@Injectable({
  providedIn: 'root'
})
export class CommonService {
  constructor(private _http : HttpClient) { }


  getMaster(typeId : number)
  {
    return this._http.get<APIResponse<ItemsList[]>>(environment.domain + "/api/Common/getMaster" + '/' + typeId);
  } 




}
