import { BaseModel } from 'src/app/models/common';

export class EmployeeRateModel  extends BaseModel {
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

}

export class EmpRate {
    active: boolean;
    effectiveDates: string;
    ragularrate: string;
    overTimeRate: string;
    discription: string;
}














