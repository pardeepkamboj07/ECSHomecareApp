export class ClientStatusModel{
    ActivityId:number;
    Date:string;
    ReferralCode:number;
    Note:string;
    OfficeUserId:number;
    OfficeUserReferralID:number;
    clientId:Number;
    text:boolean;
    screen:boolean;
    email:boolean;
     constructor(_ActivityId:number, _Date:string,_ReferralCode:number,_Note:string,_OfficeUserId:number,_OfficeUserReferralID:number,
         _clientId:Number,_officeUserId:number,_text:boolean,_screen:boolean,_email:boolean,)
     {
         this.ActivityId=_ActivityId;
         this.Date=_Date;
         this.ReferralCode=_ReferralCode;
         this.Note=_Note;
         this.OfficeUserId=_OfficeUserId;
         this.OfficeUserReferralID=_OfficeUserReferralID;
         this.clientId=_clientId;        
         this.text=_text;
         this.screen=_screen;
         this.email=_email;
     }
}

export class ClientStatusLst{
    ActivityText:string;
    Date:string;
    ReferralCodeText:string;
    Note:string;
    constructor(_ActivityText:string, _Date:string,_ReferralCode:string,_Note:string)
    {
        this.ActivityText=_ActivityText;
        this.Date=_Date;
        this.ReferralCodeText=_ReferralCode;
        this.Note=_Note;
       
    }
}