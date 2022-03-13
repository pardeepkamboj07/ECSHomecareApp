import { Time } from "@angular/common";

export class MeetingInfo {

    public meetingId : Number;
    public clientId : Number;
    public empId : Number;    
    public meetingDate : Date;
    public startTime : Date;
    public endTime : Date;
    public meetingNote : string;
    
    constructor(_meetingId : number, _empId : number, _clientId : number,_startTime:Date,_endTime:Date, _meetingDate : Date, _meetingNote : string)
    {
        this.meetingId = _meetingId;
        this.empId = _empId;
        this.clientId = _clientId;

        this.startTime = _startTime;
        this.endTime = _endTime;
        
        this.meetingDate = _meetingDate;     
        this.meetingNote = _meetingNote;
    }
}
