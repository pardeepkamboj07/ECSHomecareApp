
import { Component, OnInit  } from '@angular/core';
import { Router,ActivatedRoute } from '@angular/router';
import { ItemsList } from 'src/app/models/common';
import { MasterService } from 'src/app/services/master.service';
import { AccountService } from 'src/app/services/account.service';
import { DiagnosisItem } from 'src/app/models/master/diagnosis-item';
import { UserModel } from 'src/app/models/account/login-model';
@Component({
  selector: 'app-diagnosis-master',
  templateUrl: './diagnosis-master.component.html',
  styleUrls: [
    
    
    './diagnosis-master.component.scss']
})

export class DiagnosisMasterComponent implements OnInit {
  currentUser:UserModel;
  model=new DiagnosisItem(); 
  resultlist:DiagnosisItem[]=[];
  constructor(
    private route:ActivatedRoute,
    private accountApi: AccountService,
     private mstrApi: MasterService) {
      this.currentUser=this.accountApi.getCurrentUser();
      this.getDiagnosisList();

   }

  ngOnInit(): void {
    

  }

 

  saveChanges() {
    debugger; 

    this.model.createdBy=this.currentUser.userId;
    
    const reqObj: DiagnosisItem = this.model;

    this.mstrApi.createDiagnosis(reqObj).subscribe((response) => { 
      this.getDiagnosisList();
    });
  }
  


  getDiagnosisList() {
    this.mstrApi.getDiagnosisList().subscribe((response) => {
      if(response.result)
      {
        debugger;
        this.resultlist = response.data;
      }
    });
  }

}
