export class Empstatus {

    reason:string;
    resume:boolean;
    rehire:boolean;
    effectiveDate:string;
    returnDate:string;
    note:string;
    scheduling:number;
    officeUserId:number;
    employeeId:Number;
    typeStatusId:number;
    text:boolean;
    screen:boolean;
    email:boolean;
     constructor(_reason:string, _resume:boolean,_rehire:boolean,_effectiveDate:string,_returnDate:string,_note:string,
         _scheduling:number,_officeUserId:number,_employeeId:Number,_typeStatusId:number,_text:boolean,_screen:boolean,
         _email:boolean,)
     {
         this.reason=_reason;
         this.resume=_resume;
         this.rehire=_rehire;
         this.effectiveDate=_effectiveDate;
         this.returnDate=_returnDate;
         this.note=_note;
         this.scheduling=_scheduling;
         this.officeUserId=_officeUserId;
         this.employeeId=_employeeId;
         this.typeStatusId=_typeStatusId;
         this.text=_text;
         this.screen=_screen;
         this.email=_email;
     }
}






