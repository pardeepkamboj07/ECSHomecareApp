// export class EmpRate{
//     EffectiveDate:string;
//     EndDate:string;
//     Description:string;
//     Note:string;
//     Hourly:number;
//     Livein:number;
//     Visit:number;
//     OverHourly:number;
//     OverLivein:number;
//     OverVisit:number;
//     ApplyRateCheck:boolean;
//     OptionalHour:number;
//     OptionalAddHour:number;
//     Mileage:number;
//     TravelTime:number;
//     Gas:number;
//     Extra:number;
//     PayerId:number;
//     ClientId:number;
//     EmpId:number;
//     constructor(_EffectiveDate:string,_EndDate:string,_Description:string,_Note:string,_Hourly:number,_Livein:number,
//         _Visit:number,_OverHourly:number,_OverLivein:number,_OverVisit:number,_ApplyRateCheck:boolean,_OptionalHour:number,
//         _OptionalAddHour:number,_Mileage:number,_TravelTime:number,_Gas:number,_Extra:number,_PayerId:number,_ClientId:number,_EmpId:number){

// this.EffectiveDate=_EffectiveDate;
// this.EndDate=_EndDate;
// this.Description=_Description;
// this.Note=_Note;
// this.Hourly=_Hourly;
// this.Livein=_Livein;
// this.Visit=_Visit;
// this.OverHourly=_OverHourly;
// this.OverLivein=_OverLivein;
// this.OverVisit=_OverVisit;
// this.ApplyRateCheck=_ApplyRateCheck;
// this.OptionalHour=_OptionalHour;
// this.OptionalAddHour=_OptionalAddHour;
// this.Mileage=_Mileage;
// this.TravelTime=_TravelTime;
// this.Gas=_Gas;
// this.Extra=_Extra;
// this.PayerId=_PayerId;
// this.ClientId=_ClientId;
// this.EmpId=_EmpId;
//     }
// }

export class EmployeeRateModel {
    effectiveDate: string;
    endDate: string;
    description: string;
    note: string;
    hourly: number;
    livein: number;
    visit: number;
    overHourly: number;
    overLivein: number;
    overVisit: number;
    applyRateCheck: boolean;
    optionalHour: number;
    optionalAddHour: number;
    mileage: number;
    travelTime: number;
    gas: number;
    extra: number;
    payerId: number;
    clientId: number;
    empId: number;
    createdBy: number;
    createdOn: string;
}

export class EmpRate {
    active: boolean;
    effectiveDates: string;
    ragularrate: string;
    overTimeRate: string;
    discription: string;
}














