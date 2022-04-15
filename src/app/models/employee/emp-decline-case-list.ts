import { BaseModel } from 'src/app/models/common';

export class EmpDeclineCaseList extends BaseModel{
    repotedDate:string;  
    declineReason:string;
    assignmentStart:string;   
    day:number;
    week:number;
    clientName:string;   
    casetypeName:string;   
    
}