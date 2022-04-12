import { Component, OnInit,TemplateRef } from '@angular/core';
import{Medicationcs} from 'src/app/models/client/medicationcs-model';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { setTheme } from 'ngx-bootstrap/utils';
import { ClientApiService } from 'src/app/services/client-api.service';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { ItemsList,MasterType} from 'src/app/models/common';;

@Component({
  selector: 'app-client-medicationcs',
  templateUrl: './client-medicationcs.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './client-medicationcs.component.scss']
})
export class ClientMedicationcsComponent implements OnInit {
  modalRef?: BsModalRef;
  ClientId:number;
  MedicationcsObjList:any;
  constructor(private comApi: CommonService,
    private route:ActivatedRoute,
    private modalService: BsModalService, private clientapi : ClientApiService) { 
      setTheme('bs3');
     
    }

  model=new Medicationcs("","","","","","","","","","","","",false,false,false,false,0);

  ngOnInit(): void {
    this.route.params.subscribe(
      (params : Params) =>{   
        
        this.ClientId = Number(params["clientId"]);     
        this.getMedicationRecord();
      });
  }

  openModal(template: TemplateRef<any>) {    
    this.modalRef = this.modalService.show(template);
  }

  saveMedicationcs() {
  
    this.model.ClientID=Number(this.ClientId);
    this.model.StartDate=this.model.StartDate;
    this.model.EndDate=this.model.EndDate;
    this.model.MedicationText=this.model.MedicationText;
    this.model.NDCText=this.model.NDCText;
    this.model.StrengthText=this.model.StrengthText;
    this.model.DosageText=this.model.DosageText;
    this.model.FrequencyText=this.model.FrequencyText;
    this.model.TabsText=this.model.TabsText;
    this.model.RouteText=this.model.RouteText;
    this.model.ClassificationText=this.model.ClassificationText;
    this.model.InstructionsText=this.model.InstructionsText;
    this.model.PrescriberText=this.model.PrescriberText;
    this.model.Reminderscheck=Boolean(this.model.Reminderscheck);
    this.model.Instructionscheck=Boolean(this.model.Instructionscheck);
    this.model.administrationcheck=Boolean(this.model.administrationcheck);
    this.model.selfadministercheck=Boolean(this.model.selfadministercheck);
    this.clientapi.SaveMedicationcs(this.model).subscribe(Responce=>{      
      this.decline();
      
      this.getMedicationRecord();
     })

  }

  getMedicationRecord()
  {
    this.clientapi.getClientMedicationcsList(this.ClientId).subscribe(Responce=>{
        
      this.MedicationcsObjList=Responce.data;
    });
  }

  deleteMedicationData(MedicationId:number)
  {
    
    this.clientapi.deleteMedicationcsRecord(MedicationId,this.ClientId).subscribe(Responce=>{   
      this.getMedicationRecord();
     })
  }


  decline(): void {
  
    this.modalRef?.hide();
  }
}
