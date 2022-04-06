import { Component, OnInit } from '@angular/core';
import { ClientApiService } from 'src/app/Service/client-api.service';
import { ClientModel } from 'src/app/Model/client/client-model';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType ,SelectList} from 'src/app/Model/common';


@Component({
  selector: 'app-general-client',
  templateUrl: './general-client.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './general-client.component.scss']
})
export class GeneralClientComponent implements OnInit {

  IsLoad: boolean = false;
  model = new ClientModel();

  constructor(
    private router:Router, 
    private route:ActivatedRoute,  
    private clientApi : ClientApiService
    ) {   

     }
  ngOnInit(): void {

    this.route.params
    .subscribe(
      (params : Params) =>{
        this.model.clientId = params["clientId"];
        this.BindClientInfo(this.model.clientId);
      }
    );


  }

  BindClientInfo(userId:number)
  {
    debugger;
    this.IsLoad=true;
    this.clientApi.getClientDetail(userId).subscribe((response) => {
      this.model = response.data;
      this.IsLoad=false;
    });
  }

}
