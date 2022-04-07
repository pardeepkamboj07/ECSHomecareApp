import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders ,HttpParams } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { BehaviorSubject, Observable } from 'rxjs';
import { APIResponse } from '../Model/APIResponse';
import { LoginModel,UserModel } from 'src/app/Model/account/login-model';

const httpOptionsObj = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
  }),
};


@Injectable({
  providedIn: 'root'
})
export class AccountService {
  private userSubject: BehaviorSubject<UserModel>;
  public user: Observable<UserModel>;
  model:UserModel; 
  



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
    return this._http.post<APIResponse<UserModel>>(environment.domain + "/api/Account/logIn", _Obj,httpOptions);            
  }



  signOut1(_userid: number){ 
    debugger;
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        }; 

  

    return this._http.post<APIResponse<UserModel>>(environment.domain + "/api/Account/logOut",httpOptions);            
  }

  signOut(_userId: number): Observable<any> {

    let body = new HttpParams();
    body = body.set('UserId', _userId);

    return this._http.post(
      environment.domain + "/api/Account/logOut",
      body,
      httpOptionsObj
    );
  }












  setCurrentUser(_model: UserModel) {
    localStorage.setItem('userData', JSON.stringify(_model));
  }
  
  getCurrentUser():UserModel {
      let localObj = localStorage.getItem('userData');
      if (localObj) {
        this.model = JSON.parse(localObj) as UserModel;
      }     
      return this.model;
    }
  







}
