import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders ,HttpParams } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { BehaviorSubject, Observable } from 'rxjs';
import { APIResponse } from '../Model/APIResponse';
import { LoginModel,UserModel } from 'src/app/Model/account/login-model';

@Injectable({
  providedIn: 'root'
})
export class AccountService {
  private userSubject: BehaviorSubject<UserModel>;
  public user: Observable<UserModel>;

  constructor(private _http : HttpClient) {
    let localObj = localStorage.getItem('userData');
    if (localObj) { 

      this.userSubject = new BehaviorSubject<UserModel>(JSON.parse(localObj));
      this.user = this.userSubject.asObservable();

    }
   }

   public get userValue(): UserModel {
    return this.userSubject.value;
}

  signIn(_Obj: LoginModel){ 
    debugger;
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 
    return this._http.post<APIResponse<UserModel>>(environment.domain + "/api/Account/Login", _Obj,httpOptions);            
  }


}
