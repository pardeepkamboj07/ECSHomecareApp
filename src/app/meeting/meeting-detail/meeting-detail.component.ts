import { Component, TemplateRef ,OnInit} from '@angular/core';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { MeetingService } from 'src/app/services/meeting.service';
import { MeetingView } from 'src/app/Model/Meeting/meeting-view';
import { UserModel } from 'src/app/Model/account/login-model';
import { AccountService } from 'src/app/services/account.service';
import { MeetingStatus } from 'src/app/models/meeting/meeting-status';
import { StatusEnum } from 'src/app/Model/common';

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
  momObj?: MeetingView;
  meetingId:number;
  user: UserModel; 
  model = new MeetingStatus(); 
  IsCancel: boolean=false;  
  notes:string;
  constructor(
    private accountService: AccountService,
    public bsModalRef: BsModalRef,
    private modalService: BsModalService,    
    private momApi:MeetingService) { 
      this.user = this.accountService.userValue;  

  }

  ngOnInit(): void {
    this.BindMeeting();
  }

  BindMeeting() {
debugger;
    this.momApi.getMeetingDetail(this.meetingId).subscribe((response) => {
   
      if(response.result)
      {    
        this.momObj = response.data;
console.log(this.momObj);
debugger;
        if(this.momObj.isStatus==StatusEnum.Cancelled||this.momObj.isStatus==StatusEnum.CancelledByClient)
        {
          this.IsCancel=false;
        }
        else{

          this.IsCancel=true;
        }
      }
    });
  }



  modalRef?: BsModalRef;
  message?: string;
  openModal(template: TemplateRef<any>,_status:number) {
    this.message = 'Confirmed!';
    this.title = "Cancel Appointment By client";
    this.model.meetingId = this.momObj?.meetingId!=null?this.momObj.meetingId:0;
    this.model.isStatus = _status; 
    this.modalRef = this.modalService.show(template, {class: 'modal-sm',});
  }

  
 
  confirm(_status:number): void {
debugger;
    this.model.isStatus = _status;
    this.model.meetingId = this.momObj?.meetingId!=null?this.momObj.meetingId:0;
    const reqObj: MeetingStatus = this.model;
this.momApi.changeStatus(reqObj).subscribe((response) => {
     
    this.modalRef?.hide();

    if(_status==StatusEnum.Cancelled||_status==StatusEnum.CancelledByClient)
    {
      this.IsCancel=false;
    }
    else{
  
      this.IsCancel=true;
    }










  
    });

    








  }
 
  decline(): void {
  
    this.modalRef?.hide();
  }





  addNote(_status:number): void {
  }





  onChange(_status:number,_meetingId?:number) {
   
    this.model.isStatus = _status;
     this.model.meetingId = this.momObj?.meetingId!=null?this.momObj.meetingId:0;


 
     const reqObj: MeetingStatus = this.model;
 this.momApi.changeStatus(reqObj).subscribe((response) => {
      
  if(_status==StatusEnum.Cancelled||_status==StatusEnum.CancelledByClient)
  {
    this.IsCancel=false;
  }
  else{

    this.IsCancel=true;
  }
















   
     });


  }








}
