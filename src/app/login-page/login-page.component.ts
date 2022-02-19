import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoginapiService } from 'src/app/Service/loginapi.service'
import { LoginModel } from '../Model/login-model';


@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.scss',
  '../../assets/css/orange-blue.css',]
})
export class LoginPageComponent implements OnInit {
  model = new LoginModel('','');

  constructor(private router:Router, private loginapi : LoginapiService) { }

  ngOnInit(): void {
  }

  onClickLogin(userName:string,password:string){
   
    this.loginapi.validateuserlogininfo(userName, password).subscribe(
      (response)=>
      {
         if(response["result"] == true)
         {  
          window.localStorage.setItem('currentUser', userName);
          this.router.navigate(['/dashboard'])
         }
      },
      (error)=> console.log(error)
    )    
  }
}
