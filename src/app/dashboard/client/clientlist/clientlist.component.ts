import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Client } from 'src/app/Model/Client';
import { ClientApiService } from 'src/app/Service/client-api.service';
import { ClientMeetings } from 'src/app/Model/ClientMeetings';
import { MeetingInfo } from 'src/app/Model/MeetingInfo';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-clientlist',
  templateUrl: './clientlist.component.html',
  styleUrls: [
    '../../../../assets/css/orange-blue.css',
    './clientlist.component.scss']
})
export class ClientlistComponent implements OnInit {


  monthList  : any[] = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  Isapiresponsereceived : boolean = true;

  flag: boolean = false;
  clientList : Client[] = [];
  p: number = 1;
  totalItemsCount : number = 0;
  currentYear : number;
  currentMonthIndex : number;
  currentDay : number;
  currentDate : Date;
  ptrcurrentDate : Date;
  weekstartdate : Date;
  weekenddate : Date;
  clientmeetingList : ClientMeetings[] = [];
  weekList : Date[] = [];
  displayStyle = "none";
  meetingHeaderDate : string = "";
  meetingHeaderTime : string;
  clientFirstName : string;
  clientLastName : string;
  clientcity  : string;
  clientState : string;
  clientCountry : string;
  clientZipCode : string;
  clientEmail : string;
  clientPhone : string;
  currentweekarray : string[] = [];
  searchValue = "";
  startdate : string;
  rowData: Client[];
  cacheData: Client[];
  style = {
    width: '100%',
    height: '100%',
    flex: '1 1 auto'
    };


  



  constructor(public datepipe: DatePipe,private router:Router, private clientapi : ClientApiService)
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
    this.GetClientMeetings(this.startdate, "0");
  }

  onClickCreateClient(){
    this.router.navigate(['/Layout/saveclient/'])
  }

  onClickCreateClientMeeting(cId : string){
    this.router.navigate(['/Layout/clientevent/' + cId])
  }

  GetClientMeetings(startdate : string, clientId : string)
  {
    this.clientapi.getClientMeetingList("2022-01-01", clientId).subscribe(response => {
          this.clientmeetingList = response.data;
          //console.log(this.clientmeetingList);
        });
  }

  getstate(state : string)
  {

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
      let x : string = this.datepipe.transform(newDate,"MM/dd/yyyy") || "";
      this.currentweekarray.push(x);
      dateList.push(newDate);
      if(i == 0)
        this.startdate = this.datepipe.transform(newDate,"yyyy-MM-dd") || "";
    }
    return dateList;
  }

  OnClickNextWeek()
  {
    this.ptrcurrentDate.setDate(this.ptrcurrentDate.getDate() + 7);
    this.currentYear = this.ptrcurrentDate.getFullYear();
    this.currentMonthIndex = this.ptrcurrentDate.getMonth();
    this.currentDay = this.ptrcurrentDate.getDate();
    this.weekList = this.getWeekDays(this.currentDay, this.currentMonthIndex, this.currentYear);
  }

  OnClickPrevWeek()
  {
    // if(this.ptrcurrentDate > this.currentDate)
      this.ptrcurrentDate.setDate(this.ptrcurrentDate.getDate() - 7);
    this.currentYear = this.ptrcurrentDate.getFullYear();
    this.currentMonthIndex = this.ptrcurrentDate.getMonth();
    this.currentDay = this.ptrcurrentDate.getDate();
    this.weekList = this.getWeekDays(this.currentDay, this.currentMonthIndex, this.currentYear);
  }

  pageChanged(event : any){
    this.p = event;
  }

  rowclicked(client : ClientMeetings)
  {
    this.router.navigate(['/Layout/clientinfo/' + client.clientId])
  }

  openPopup(client : ClientMeetings, meetingInfo : MeetingInfo) {
    this.meetingHeaderDate = this.datepipe.transform(meetingInfo.meetingDate, 'EEEE, MMMM d')?.toString() as string;
    this.meetingHeaderTime = meetingInfo.startTime + '-' + meetingInfo.endTime;
    this.clientPhone = client.cellPhone;
    this.clientState = client.cState;
    this.clientZipCode = client.zipCode;
    this.clientcity = client.city;
    this.clientCountry = client.country;
    this.clientFirstName = client.firstName;
    this.clientLastName = client.lastName;
    this.clientEmail = client.email;
    this.displayStyle = "block";
  }

  closePopup() {
    this.displayStyle = "none";
  }
}
