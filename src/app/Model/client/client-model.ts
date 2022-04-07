

export class ClientModel {
    clientId: number;
    billTo: string;
    sSN: string;
    firstName: string;
    middleName: string;
    lastName: string;
    dOB: string;
    email: string;
    contact: string;
    coordinator: number | null;
    nurse: number | null;
    ofChild: number;
    gender: number;
    
    ethnicity: number;
    maritalStatus: number;
    emgContact: string;
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
    isActive: number;
  
}