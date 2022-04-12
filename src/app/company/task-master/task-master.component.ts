import { Component, OnInit } from '@angular/core';
import { Router,ActivatedRoute } from '@angular/router';
import { CommonService } from 'src/app/services/common.service';
import { AccountService } from 'src/app/services/account.service';
import {  TaskModel}  from 'src/app/models/client/service-task-model';
import { UserModel } from 'src/app/models/account/login-model';

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
  taskLst:TaskModel[]=[];
  currentUser:UserModel;
  constructor(
    private route:ActivatedRoute,
    private comApi: CommonService,
    private accountApi: AccountService


  ) {
    this.currentUser=  this.accountApi.getCurrentUser();
    this.bindTaskList();
 
   }

  ngOnInit(): void {
  }


  addNewTask() {
    debugger; 

    
    this.model.createdBy=this.currentUser.userId;
    const reqObj: TaskModel = this.model;
    
    this.comApi.createTask(reqObj).subscribe((response) => { 
      this.bindTaskList();
      this.model.taskCode="";
      this.model.taskName="";
    });
  }


  bindTaskList() {
    this.comApi.getTaskList().subscribe((response) => {
      if(response.result)
      {
        debugger;
        this.taskLst = response.data;
      }
    });
  }




}

