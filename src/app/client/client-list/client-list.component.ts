import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Client } from 'src/app/Model/Client';
import { ClientApiService } from 'src/app/Service/client-api.service';

import { ClientMeeting } from 'src/app/Model/Meeting/client-meeting';
import { MeetingInfo } from 'src/app/Model/MeetingInfo';
import { DatePipe } from '@angular/common';
import { MeetingService } from 'src/app/services/meeting.service';

import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';


@Component({
  selector: 'app-client-list',
  templateUrl: './client-list.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './client-list.component.scss']
})


export class ClientListComponent implements OnInit {

monthList  : any[] = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
clientMOMList : ClientMeeting[] = [];


currentYear : number;
currentMonthIndex : number;
currentDay : number;
currentDate : Date;
ptrcurrentDate : Date;
weekstartdate : Date;
weekenddate : Date;
currentweekarray : string[] = [];
weekList : Date[] = [];






Isapiresponsereceived : boolean = true;
  clientList : Client[] = [];
  p: number = 1;
  totalItemsCount : number = 0;
  

  // clientmeetingList : ClientMeetings[] = [];



  searchValue = "";
  startdate : string;
  rowData: Client[];
  cacheData: Client[];


  



  constructor(public datepipe: DatePipe,private router:Router, private clientapi : ClientApiService,private momApi:MeetingService)
  {
    this.currentDate = new Date();
    this.ptrcurrentDate = new Date();
    this.currentYear = new Date().getFullYear();
    this.currentMonthIndex = new Date().getMonth();
    this.currentDay = new Date().getDate();
  }

  ngOnInit(): void {
        this.clientapi.getClientList().subscribe(response => {
          this.clientList = response.data;
        });
    this.weekList = this.getWeekDays(this.currentDay, this.currentMonthIndex, this.currentYear);
    this.momApi.getClientMeetingList().subscribe((response) => {
      if(response.result)
      {
        debugger;
        this.clientMOMList = response.data;

        console.log( this.clientMOMList);
        console.log( this.currentweekarray);
  
      }
    });
  }

  public getWeekDays(day : number, monthIndex : number, year : number): Date[] {
    var weeknumber = new Date().getDay();
    var dd = new Date(year, monthIndex, day);
    dd.setDate(dd.getDate() - weeknumber);
    const dateList: Date[] = [];
    this.currentweekarray = [];
    for (let i = 0; i <= 6; i++) {
      const newDate = new Date(dd.getTime());
      newDate.setDate(newDate.getDate() + i);
      let x : string = this.datepipe.transform(newDate,"yyyy-MM-dd") || "";
      this.currentweekarray.push(x);
      dateList.push(newDate);
      if(i == 0)
        this.startdate = this.datepipe.transform(newDate,"yyyy-MM-dd") || "";
    }
    return dateList;
  }

  OnNextWeek()
  {
    this.ptrcurrentDate.setDate(this.ptrcurrentDate.getDate() + 7);
    this.currentYear = this.ptrcurrentDate.getFullYear();
    this.currentMonthIndex = this.ptrcurrentDate.getMonth();
    this.currentDay = this.ptrcurrentDate.getDate();
    this.weekList = this.getWeekDays(this.currentDay, this.currentMonthIndex, this.currentYear);
  }

  OnPrevWeek()
  {
    // if(this.ptrcurrentDate > this.currentDate)
      this.ptrcurrentDate.setDate(this.ptrcurrentDate.getDate() - 7);
    this.currentYear = this.ptrcurrentDate.getFullYear();
    this.currentMonthIndex = this.ptrcurrentDate.getMonth();
    this.currentDay = this.ptrcurrentDate.getDate();
    this.weekList = this.getWeekDays(this.currentDay, this.currentMonthIndex, this.currentYear);
  }





  // GetClientMeetings(startdate : string, clientId : string)
  // {
  //   this.clientapi.getClientMeetingList("2022-01-01", clientId).subscribe(response => {
  //         this.clientmeetingList = response.data;
  //         //console.log(this.clientmeetingList);
  //       });
  // }

  getstate(state : string)
  {

  }





  






  pageChanged(event : any){
    this.p = event;
  }

  // rowclicked(client : ClientMeetings)
  // {
  //   this.router.navigate(['/Layout/clientinfo/' + client.clientId])
  // }




  meetingDetail(meetingId:number)
  {

  }


  public addMeeting(clientId:number)
  {
    this.router.navigate(['/client/schedule/'+clientId])
  }









}
