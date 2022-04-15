import { BaseModel } from 'src/app/models/common';
export class ClientContactLog extends BaseModel {
    contactlogId: number;
    officeUserId: number;
    empId: number;
    reason: string;
    callDateTime: string;
    scheduleDate: string;
    followUpDate: string;
    issue: string;
    actionTaken: string;
    notes: string;
    isFollowUp: boolean;
    isSchedule: boolean;
}