import { BaseModel } from 'src/app/models/common';

export class EmployeeDecline extends BaseModel {
    declinedId: number;
    reportedDate: string;
    empId: number;
    caseType: number;
    reason: string;
    startDate: string;
    notes: string;
}

export class EmployeeDeclineView {
    declinedId: number;
    reportedDate: string;
    empId: number;
    empName: string;
    caseType: number;
    reason: string;
    startDate: string;
    notes: string;
}