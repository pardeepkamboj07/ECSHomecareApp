import { Component, OnInit  } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { Router,ActivatedRoute } from '@angular/router';
import { ItemsList } from 'src/app/Model/common';

@Component({
  selector: 'app-master-type',
  templateUrl: './master-type.component.html',
  styleUrls: [
    '../../../../assets/css/orange-blue.css',
    './master-type.component.scss']
})
export class MasterTypeComponent implements OnInit {


  masterType :string ='';
  masterTypeList :Array<ItemsList>=[];
  constructor(
    private route:ActivatedRoute,
     private comApi: CommonService) {

   }

  ngOnInit(): void {

    this.getMasterType();
  }


  saveType() {
    debugger;  
    this.comApi.addMasterType(this.masterType).subscribe((response) => { 
      this.getMasterType();
    });
  }
  
  getMasterType() {
    this.comApi.getMasterType().subscribe((response) => {
      if(response.result)
      {
        debugger;
        this.masterTypeList = response.data;
      }
    });
  }

}
