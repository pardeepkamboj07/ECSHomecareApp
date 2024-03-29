import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders ,HttpParams } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { BehaviorSubject, Observable } from 'rxjs';
import { APIResponse } from '../models/api-response';
import { DiagnosisItem } from 'src/app/models/master/diagnosis-item';

const httpOptionsObj = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
  }),
};

@Injectable({
  providedIn: 'root'
})
export class MasterService {

  constructor(private _http : HttpClient) {
 
   }

  
    createDiagnosis(reqObj : DiagnosisItem){ 
      var headers_object = new HttpHeaders();
          headers_object.append('Content-Type', 'application/json');
          var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
          const httpOptions = {
            headers: headers_object
          };
      return this._http.post(environment.domain + "/api/Master/createDiagnosis", reqObj,httpOptions);            
    }
  

    getDiagnosisList()
    {
      return this._http.get<APIResponse<DiagnosisItem[]>>(environment.domain + "/api/Master/getDiagnosis");
    } 
  


}
