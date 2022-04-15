
	
	import { BaseModel } from 'src/app/models/common';
	
	

	
	

export class SaveEmpDeclinedCase extends BaseModel{
    repotedDate:string;
    clientId:number;
    casetypeId:number;
    declineReason:string;
    assignmentStart:string;
    note:string;
    day:number;
    week:number;
    empId:number;
    clientName:string;   
    casetypeName:string;   
    constructor(_RepotedDate:string,_clientId:number,_Casetype:number,_DeclineReason:string,_AssignmentStart:string,_Note:string,
        _Day:number,_Hour:number,_ClientName:string,_casetype:string,empId:number){

            super();

this.repotedDate=_RepotedDate;
this.clientId=_clientId;
this.casetypeId=_Casetype;
this.declineReason=_DeclineReason;
this.assignmentStart=_AssignmentStart;
this.note=_Note;
this.day=_Day;
this.week=_Hour;
this.clientName=_ClientName;
this.empId=empId;

    }
}

