import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AccountService } from 'src/app/services/account.service';
import { LoginModel } from 'src/app/Model/account/login-model';
@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './sign-in.component.scss']
})
export class SignInComponent implements OnInit {
  model = new LoginModel();
  constructor(private router:Router, private accountApi : AccountService) { }

  ngOnInit(): void {
  }

  signIn(userName:string,password:string){
  
    this.model.userName=userName;
    this.model.password=password;   
    this.accountApi.signIn(this.model).subscribe((response) => {

      if((response.data.loginInId>0))
      {
        localStorage.setItem('userData', JSON.stringify(response.data));
        this.router.navigate(['/dashboard']);
      }
      else{
        alert('Login credentials are not correct.');
      }
      
     
    });
        
  }

}
