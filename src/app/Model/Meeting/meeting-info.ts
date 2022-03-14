import { Time } from "@angular/common";

export class MeetingInfo {
  
    public meetingId : Number;
    public clientId : Number;
    public empList : Number[];    
    public empId : Number;    
    public meetingDate : string;
    public startTime : string;
    public endTime : string;
    public meetingNote : string;
    
    constructor(_meetingId : number, _empList : Number[],_empId : Number, _clientId : number,_startTime:string,_endTime:string, _meetingDate : string, _meetingNote : string)
    {
        this.meetingId = _meetingId;
        this.empList = _empList;
        this.empId = _empId;
        this.clientId = _clientId;
        this.startTime = _startTime;
        this.endTime = _endTime;        
        this.meetingDate = _meetingDate;     
        this.meetingNote = _meetingNote;
    }
}
