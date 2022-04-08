import { AccountUserModel} from 'src/app/models/account/account-model';

export class ClientModel extends AccountUserModel {
    clientId: number;
    billTo: string;
    contact: string;
    nurseId: number;
    ofChild: number;
    altId: string;
    iD2: string;
    iD3: string;
    insuranceID: string;
    workerName: string;
    workerContact: string;
    referredBy: string;
    priorityCode: number;
    timeSlip: boolean;
    isHourly: boolean;
    coordinatorName: string;
    nurseName: string;
    genderName: string;
    ethnicityName: string;
    maritalStatusName: string;
}


