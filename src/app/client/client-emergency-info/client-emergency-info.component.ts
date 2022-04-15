import { Component, OnInit,TemplateRef } from '@angular/core';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { ClientApiService } from 'src/app/services/client-api.service';

import{ClientEmrgencyInfo} from 'src/app/models/client/EmergencyInfo';


@Component({
  selector: 'app-client-emergency-info',
  templateUrl: './client-emergency-info.component.html',
  styleUrls: ['./client-emergency-info.component.scss']
})
export class ClientEmergencyInfoComponent implements OnInit {
  editMode:boolean=false;
  EmergencyInfoLst:any;
   
model:ClientEmrgencyInfo[]=[];
  constructor(
    private route:ActivatedRoute,
    private modalService: BsModalService, private clientapi : ClientApiService) {
     
     }
  ClientId:number;
  ngOnInit(): void {
    this.route.params.subscribe(
      (params : Params) =>{   
        
        this.ClientId = Number(params["clientId"]);     
        this.getEmergencyInfoList();
      });
  }


  edit(data:any)
  {
   
    data.edit=false;
   
  }

  getEmergencyInfoList()
  {
       this.clientapi.getEmergencyInfoList(this.ClientId).subscribe(Responce=>{
         console.log(Responce.data);
          this.EmergencyInfoLst=Responce.data;
       });
  }

 
}
