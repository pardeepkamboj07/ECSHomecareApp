import { Component, OnInit } from '@angular/core';
import { Router,ActivatedRoute } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import {  TaskModel}  from 'src/app/models/client/service-task-model';
import { setTheme } from 'ngx-bootstrap/utils';
@Component({
  selector: 'app-task-master',
  templateUrl: './task-master.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './task-master.component.scss']
})
export class TaskMasterComponent implements OnInit {
  IsLoad: boolean = false;
  model = new TaskModel();
  constructor(
    private route:ActivatedRoute,
    private comApi: CommonService


  ) {
    setTheme('bs3');
   }

  ngOnInit(): void {
  }


  addNewTask() {
    debugger; 
    const reqObj: TaskModel = this.model;
    
    // this.comApi.createMaster(reqObj).subscribe((response) => { 
    //   this.getMasterList();
    // });
  }

}

