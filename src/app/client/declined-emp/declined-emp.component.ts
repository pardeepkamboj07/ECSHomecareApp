import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { ItemsList } from 'src/app/models/common';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { EmployeeDecline,EmployeeDeclineView }  from 'src/app/models/client/employee-decline';
import { LoginModel,UserModel } from 'src/app/models/account/login-model';
import { AccountService } from 'src/app/services/account.service';
import { ClientApiService } from 'src/app/services/client-api.service';
import { CommonService } from 'src/app/services/common.service';
import { DatePipe } from '@angular/common';
@Component({
  selector: 'app-declined-emp',
  templateUrl: './declined-emp.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',  
    './declined-emp.component.scss']
})
export class DeclinedEmpComponent implements OnInit {

  modalRef?: BsModalRef;
  empList = Array<ItemsList>(); 
  declinedList:EmployeeDeclineView[]=[];  
  currentUser:UserModel;
 model=new EmployeeDecline();
  constructor(
    private route:ActivatedRoute,
    private datepipe: DatePipe,
    private modalService: BsModalService,
    private accountApi: AccountService,
    private comApi: CommonService,
    private clientApi : ClientApiService
    ) { 

      this.currentUser=this.accountApi.getCurrentUser();


      this.comApi.getEmpList().subscribe((response) => {
        if(response.result)
        {
          debugger;
          this.empList = response.data;
        }
      });



  
  

    }

  ngOnInit(): void {
    debugger
    this.route.params.subscribe(
      (params : Params) =>{
         this.model.userId = Number(params["clientId"]);

         this.GetDeclinedList(this.model.userId);

      }
    );
   
  }

  openModal(template: TemplateRef<any>) {
   this.modalRef = this.modalService.show(template);
 }





 closeModel(): void {
  this.modalRef?.hide();

  this.model.reportedDate="";
  this.model.startDate="";
}

 

saveDeclined() { 

  debugger;
   this.model.caseType=Number(this.model.caseType);
   this.model.userId=Number(this.model.userId);
   this.model.createdBy=this.currentUser.userId;


   this.model.reportedDate=this.datepipe.transform(this.model.reportedDate, 'dd-MM-yyyy, hh:mm:ss a')||"";   
   this.model.startDate=this.datepipe.transform(this.model.startDate, 'dd-MM-yyyy')||"";   

   this.model.empId=Number(this.model.empId);


   this.clientApi.createEmpDeclined(this.model).subscribe((response) => {
    this.GetDeclinedList(this.model.userId);  
    this.closeModel();
 }); 
 }




GetDeclinedList(userId : number) {
this.clientApi.getEmpDeclined(userId).subscribe((response) => {
    this.declinedList = response.data;
    console.log(response);
  });
}



delDeclined(declinedId:number) { 

debugger;

  this.clientApi.deleteEmpDeclined(declinedId).subscribe((response) => {
   this.GetDeclinedList(this.model.userId);  
   this.closeModel();
}); 

}










}
