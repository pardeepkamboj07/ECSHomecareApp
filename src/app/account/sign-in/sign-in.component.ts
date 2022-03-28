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



      // let lObj = this.companyService.getOption();
      // if (lObj) {
      //   this.BindCompanyList(lObj.userId, lObj.companyId);
      //   this.model.companyId = lObj.companyId;
      //   this.userId = lObj.userId;
  
      //   this.getLocation();
      //   // this.getStyle('');
      // }

      // if (response.isLogin) {
      //   localStorage.setItem('userData', JSON.stringify(response));
      //   this.router.navigate(['./dashboard']);
      // } else {
      //   alert('UserName or Password Incorrect.');
      // }







      if((response.data.loginInId>0))
      {
        this.router.navigate(['/dashboard']);
      }
      // console.log(response.data.loginInId>0);
     
    });
        
  }

}
