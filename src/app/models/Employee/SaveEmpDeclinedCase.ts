export class SaveEmpDeclinedCase{
    RepotedDate:string;
    clientId:number;
    Casetypeid:number;
    DeclineReason:string;
    AssignmentStart:string;
    Note:string;
    Day:number;
    week:number;
    empId:number;
    ClientName:string;   
    CasetypeName:string;   
    constructor(_RepotedDate:string,_clientId:number,_Casetype:number,_DeclineReason:string,_AssignmentStart:string,_Note:string,
        _Day:number,_Hour:number,_ClientName:string,_casetype:string,empId:number){
this.RepotedDate=_RepotedDate;
this.clientId=_clientId;
this.Casetypeid=_Casetype;
this.DeclineReason=_DeclineReason;
this.AssignmentStart=_AssignmentStart;
this.Note=_Note;
this.Day=_Day;
this.week=_Hour;
this.ClientName=_ClientName;
this.empId=empId;

    }
}

