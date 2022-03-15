export class Empmeeting {


    public meetingId : Number;
    public ClientName : string;       
    public meetingDate : string;
    public startTime : string;
    public endTime : string;
    public meetingNote : string;
    
    constructor(_meetingId : number,_ClientName : string,_startTime:string,_endTime:string,
         _meetingDate : string, _meetingNote : string)
    {
        this.meetingId = _meetingId;        
        this.ClientName = _ClientName;
        this.startTime = _startTime;
        this.endTime = _endTime;        
        this.meetingDate = _meetingDate;     
        this.meetingNote = _meetingNote;
    }
}
