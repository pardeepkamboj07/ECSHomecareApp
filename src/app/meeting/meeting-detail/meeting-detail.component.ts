import { Component, OnInit } from '@angular/core';
import {  BsModalRef } from 'ngx-bootstrap/modal';
import { MeetingService } from 'src/app/services/meeting.service';
import { MeetingView } from 'src/app/Model/Meeting/meeting-view';
@Component({
  selector: 'app-meeting-detail',
  templateUrl: './meeting-detail.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './meeting-detail.component.scss']
})
export class MeetingDetailComponent implements OnInit {
  title?: string;
  closeBtnName?: string;
  momObj: MeetingView;
  meetingId:number;
  constructor(public bsModalRef: BsModalRef,private momApi:MeetingService) { 
   
  }

  ngOnInit(): void {
    this.BindMeeting() 
  }


  BindMeeting() {
debugger;
    this.momApi.getMeetingDetail(this.meetingId).subscribe((response) => {
      debugger;
      if(response.result)
      {       
        debugger;
        this.momObj = response.data;

        console.log(response.data);
      }
    });
  }

}
