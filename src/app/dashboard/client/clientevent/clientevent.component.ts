import { Component, OnInit } from '@angular/core';
import { ClientApiService } from 'src/app/Service/client-api.service';
import { ClientMeetings } from 'src/app/Model/ClientMeetings';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { DatePipe } from '@angular/common';
import { MeetingDetails } from 'src/app/Model/MeetinDetails';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-clientevent',
  templateUrl: './clientevent.component.html',
  styleUrls: ['./clientevent.component.scss']
})
export class ClienteventComponent implements OnInit {

  clientmeetingList : ClientMeetings[] = [];
  schedulemeetingdetails : MeetingDetails;
  clientId : string = "0";
  startdate : string;
  meetingdate : string;
  timein : string[] = [];
  timeout : string[] = [];
  tIn : string = "12:00 AM";
  tOut : string = "12:00 AM";
  errormessage : string = "";
  errorStatus : boolean = false;
  timeDiff="00:00";

  constructor(private router:Router, 
    private route:ActivatedRoute,
    public datepipe: DatePipe,
    private clientapi : ClientApiService) 
    { }

  ngOnInit(): void {
    
    this.route.params
    .subscribe(
      (params : Params) =>{
        this.clientId = params["clientId"];
      }
    );
    
    var date = this.getWeekDays(new Date().getDate(), new Date().getMonth(), new Date().getFullYear());
    this.GetClientMeetings(date, this.clientId);
    this.schedulemeetingdetails = new MeetingDetails;
  }
calculateTimeDiff(){
  var difference = Date.parse(('2022-01-02 ' + this.timeout[1] + ':' + this.timeout[2] + ' ' + this.timeout[3])) 
                  - Date.parse(('2022-01-02 ' + this.timein[1] + ':' + this.timein[2] + ' ' + this.timein[3]));
                  var hoursDifference = Math.floor(difference/1000/60/60);
                  difference -= hoursDifference*1000*60*60
              
                  var minutesDifference = Math.floor(difference/1000/60);
                  difference -= minutesDifference*1000*60
              
                  var secondsDifference = Math.floor(difference/1000);
              
                 if(!isNaN(hoursDifference)&& !isNaN(minutesDifference))
                    return hoursDifference+":"+minutesDifference;
                return "00:00"
}
  onMeetingDateChnage(mdate : any)
  {
    this.meetingdate = mdate;

  }

  GetMeetingTimeOUT(value : string)
  {
    this.timeout = value.split(":");
    this.tOut = (this.timeout[1] + ':' + this.timeout[2] + ' ' + this.timeout[3]);
    var xyz= this.calculateTimeDiff();
    this.timeDiff = xyz==null?"00:00":xyz.toString();
  }

  GetMeetingTimeIN(value : string)
  {
    this.timein = value.split(":");
    this.tIn = (this.timein[1] + ':' + this.timein[2] + ' ' + this.timein[3]);
    var xyz= this.calculateTimeDiff();
    this.timeDiff = xyz==null?"00:00":xyz.toString();
  }

  GetClientMeetings(startdate : string, clientId : string)
  {
    this.clientapi.getClientMeetingList(startdate, clientId).subscribe(response => {
      this.clientmeetingList = response.data;
        }); 
  }

  // OnSubmit(forminfo)
  // {

  // }

  public getWeekDays(day : number, monthIndex : number, year : number): string {
    var weeknumber = new Date().getDay();
    var dd = new Date(year, monthIndex, day);
    dd.setDate(dd.getDate() - weeknumber);
    const dateList: Date[] = [];
    for (let i = 0; i <= 0; i++) {
      const newDate = new Date(dd.getTime());
      newDate.setDate(newDate.getDate() + i);
      let x : string = this.datepipe.transform(newDate,"MM/dd/yyyy") || "";
      if(i == 0)
        this.startdate = this.datepipe.transform(newDate,"yyyy-MM-dd") || "";
    }
    return this.startdate;
  }

  ScheduleMeeting()
  {
    //console.log(this.meetingdate);
    this.schedulemeetingdetails.meetingDate = new Date(this.meetingdate);
    this.schedulemeetingdetails.mClientId = Number(this.clientId);
    this.schedulemeetingdetails.meetingNote = "";
    this.schedulemeetingdetails.MeetingStartHrsTime = this.timein[1];
    this.schedulemeetingdetails.MeetingStartMinsTime = this.timein[2];
    this.schedulemeetingdetails.MeetingEndHrsTime = this.timeout[1];
    this.schedulemeetingdetails.MeetingEndMinsTime = this.timeout[2];
    var diffInMs = Date.parse(('2022-01-02 ' + this.timeout[1] + ':' + this.timeout[2] + ' ' + this.timeout[3])) 
                  - Date.parse(('2022-01-02 ' + this.timein[1] + ':' + this.timein[2] + ' ' + this.timein[3]));
    var diffInHours = diffInMs / 1000 / 60 / 60;
    var diffmins = 0;
    var xyz = diffInHours.toString().split(".");
    //console.log(xyz[1]);
    if(xyz[1] != undefined)
      diffmins = Number('0.'+xyz[1])*60;
    //console.log(diffInHours);
    //console.log(diffmins);
    this.schedulemeetingdetails.totalMeetingHrs = Number(xyz[0]);
    this.schedulemeetingdetails.totalMeetingMins = diffmins;
    this.schedulemeetingdetails.StartTimeType = this.timein[3];
    this.schedulemeetingdetails.EndTimeType = this.timeout[3];
    // console.log(this.schedulemeetingdetails);
    if(this.meetingdate==undefined){
      this.errormessage="Please select a meeting date"
    }
    else if(this.timein.length==0){
      this.errormessage="Please select a time In"
    }
    else if(this.timeout.length==0){
      this.errormessage="Please select a time Out"
    }
    else if(Number(this.timein[0]) >= Number(this.timeout[0]))
    {
      this.errorStatus = true;
      this.errormessage = "TimeIn cannot be greater than TimeOut";
    }
    else
      {
        console.log('save');
        this.errormessage = "";
        this.errorStatus = false;
        this.saveclientmeeting(this.schedulemeetingdetails);
      }
  }

  saveclientmeeting(meetingInfo : MeetingDetails)
  {
    this.clientapi.savescheduledmeeting(meetingInfo).subscribe(
      (response)=>
      {
        this.router.navigate(['/dashboard/clientlist'])
      },
      (error)=> {
        console.log(error);
      }
      )      
  }
}
