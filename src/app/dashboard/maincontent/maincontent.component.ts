import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-maincontent',
  templateUrl: './maincontent.component.html',
  styleUrls: ['./maincontent.component.scss']
})
export class MaincontentComponent implements OnInit {

  display_client_form:boolean = false;
  display_emp_form:boolean=false;
  constructor(private router:Router) { }

  ngOnInit(): void {
  }
  onClickButton(input: string){
    if(input=="client"){ 
      this.display_client_form=true;
      this.display_emp_form=false;
      this.router.navigate(['/dashboard/clientlist']);
    }
     
    if(input=="employee"){
      this.display_emp_form=true;
      this.display_client_form=false;
      this.router.navigate(['/dashboard/employeelist']);
    }

    if(input=="invoice"){
      this.display_emp_form=true;
      this.display_client_form=false;
      this.router.navigate(['/dashboard/getinvoicelist']);
    }
  }

}
