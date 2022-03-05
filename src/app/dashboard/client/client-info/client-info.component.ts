import { Component, OnInit } from '@angular/core';
import { ClientApiService } from 'src/app/Service/client-api.service';
import { ClientMeetings } from 'src/app/Model/ClientMeetings';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { DatePipe } from '@angular/common';
import { MeetingDetails } from 'src/app/Model/MeetinDetails';

@Component({
  selector: 'app-client-info',
  templateUrl: './client-info.component.html',
  styleUrls: [
    '../../../../assets/css/orange-blue.css',   
    './client-info.component.scss']
})
export class ClientInfoComponent implements OnInit {

  clienId : string = "-1";
  clientinfo : ClientMeetings;
  clientName : string = "";

  constructor(private router:Router, 
    private route:ActivatedRoute,
    public datepipe: DatePipe,
    private clientapi : ClientApiService) 
    { }

  ngOnInit(): void {
    this.route.params
    .subscribe(
      (params : Params) =>{
        this.clienId = params["cId"];
      }
    );

    this.GetClientMeetings(this.clienId);
  }

  GetClientMeetings(clientId : string)
  {
    this.clientapi.getClientMeetingbyId(clientId).subscribe(response => {
          var result = response.data;
          console.log('test');
          this.clientinfo = result[0];
          console.log(this.clientinfo.meetingInfo);
          this.clientName = this.getClientName(this.clientinfo);
        }); 
  }

  getClientName(client : ClientMeetings) : string 
  {
    if(client.lastName.length > 0)
    {
      return client.lastName + ',' + client.firstName;
    }
    else
    {
      return client.firstName;
    }
  }

}
