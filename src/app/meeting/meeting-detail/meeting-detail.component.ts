import { Component, OnInit } from '@angular/core';
import {  BsModalRef } from 'ngx-bootstrap/modal';
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
  constructor(public bsModalRef: BsModalRef) { }

  ngOnInit(): void {
  }

}
