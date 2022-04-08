import { Component, OnInit  } from '@angular/core';
import { CommonService } from 'src/app/services/common.service';
import { Router,ActivatedRoute } from '@angular/router';
import { ItemsList } from 'src/app/models/common';
import { ItemModel } from 'src/app/admin/model/item-model';
@Component({
  selector: 'app-system-master',
  templateUrl: './system-master.component.html',
  styleUrls: [
    '../../../../assets/css/orange-blue.css',
    './system-master.component.scss']
})
export class SystemMasterComponent implements OnInit {

  model=new ItemModel(0,0,'');
  masterTypeList = Array<ItemsList>();
  masterList = Array<ItemModel>();
  
  masterType :string ='';
  constructor(
    private route:ActivatedRoute,
     private comApi: CommonService) {

   }

  ngOnInit(): void {
    
    this.getMasterType();
    this.getMasterList();
  }

 

  saveMaster() {
    debugger; 
    this.model.itemId=Number(this.model.itemId);
    this.model.masterType=Number(this.model.masterType);
    
    const reqObj: ItemModel = this.model;

    this.comApi.createMaster(reqObj).subscribe((response) => { 
      this.getMasterList();
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

  getMasterList() {
    this.comApi.getSystemMaster().subscribe((response) => {
      if(response.result)
      {
        debugger;
        this.masterList = response.data;
      }
    });
  }

}
