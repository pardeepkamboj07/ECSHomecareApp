import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders  } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';
import { APIResponse } from '../Model/APIResponse';
import { MeetingInfo } from 'src/app/Model/Meeting/meeting-info';
import { Empmeeting } from 'src/app/Model/Meeting/empmeeting';
import { ClientMeeting } from 'src/app/Model/Meeting/client-meeting';
import { MeetingView } from 'src/app/Model/Meeting/meeting-view';

import { MeetingStatus ,NotesModel} from 'src/app/models/meeting/meeting-status';

@Injectable({
  providedIn: 'root'
})
export class MeetingService {

  constructor(private _http : HttpClient) { }
  createMeeting(momObj : MeetingInfo){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        };
    return this._http.post(environment.domain + "/api/Meeting/addMeeting", momObj,httpOptions);            
  }

  getEmployeeMeeting(empId : number)
  {
    return this._http.get<APIResponse<Empmeeting[]>>(environment.domain + "/api/Meeting/getEmpMeeting" + '/' + empId);
  } 

  getClientMeetingList()
  {
    return this._http.get<APIResponse<ClientMeeting[]>>(environment.domain + "/api/Meeting/getClientMeetingList");
  } 

  getMeetingDetail(meetingId : number)
  {
    debugger;
    return this._http.get<APIResponse<MeetingView>>(environment.domain + "/api/Meeting/getMeetingDetail" + '/' + meetingId);
  } 


  


  changeStatus(momObj : MeetingStatus){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        };
    return this._http.post(environment.domain + "/api/Meeting/updateStatus", momObj,httpOptions);            
  }


  addNote(pointObj : NotesModel){ 
    var headers_object = new HttpHeaders();
        headers_object.append('Content-Type', 'application/json');
        var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
        const httpOptions = {
          headers: headers_object
        };
    return this._http.post(environment.domain + "/api/Meeting/addNote", pointObj,httpOptions);            
  }


}
