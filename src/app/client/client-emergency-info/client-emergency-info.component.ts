import { Component, OnInit,TemplateRef } from '@angular/core';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { ClientApiService } from 'src/app/services/client-api.service';

import{ClientEmrgencyInfo} from 'src/app/models/client/EmergencyInfo';


@Component({
  selector: 'app-client-emergency-info',
  templateUrl: './client-emergency-info.component.html',
  styleUrls: ['../../../assets/css/orange-blue.css','./client-emergency-info.component.scss']
})
export class ClientEmergencyInfoComponent implements OnInit {
  editMode:boolean=false;
  EmergencyInfoLst:any;
  modalRef?: BsModalRef;
model=new ClientEmrgencyInfo();
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



 
  getEmergencyInfoList()
  {
       this.clientapi.getEmergencyInfoList(this.ClientId).subscribe(Responce=>{         
          this.EmergencyInfoLst=Responce.data;        
       });
  }


  openModal(template: TemplateRef<any>,Id:number,Type:string) {
    this.model.id=Id;
  this.model.type=Type;
   this.modalRef = this.modalService.show(template);
 }
 
 decline(): void {
  
   this.modalRef?.hide();
 }

 onClickSubmit() { 
   debugger;  
  
  this.model.title=this.model.title;
  this.model.firstName=this.model.firstName;
  this.model.lastName=this.model.lastName;
  this.model.nPINumber=this.model.nPINumber;
  this.model.license=this.model.license;
  this.model.licenseExpires=this.model.licenseExpires;
  this.model.phone=this.model.phone;
  this.model.fax=this.model.fax;
  this.model.state=this.model.state;
  this.model.address=this.model.address;
  this.model.zip=this.model.zip;
this.clientapi.SaveEmergencyInfo(this.model).subscribe(Response=>{
  this.getEmergencyInfoList()   
})

   }
 
}
