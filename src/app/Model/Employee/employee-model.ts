export class EmployeeModel {
    empId: number;
    empKey: string;    
    sSN: string;
    empType: number;
    firstName: string;
    middleName: string;
    lastName: string;
    dOB: string;
    email: string;
    cellPhone: string;
    dateOfHire: string;
    homePhone: string;
    dateOfFirstCase: string;
    gender: number;
    hRSupervisor: number;
    enthnicity: number;
    maritalStatus: number;
    dependents: number;
    city: string;
    country: string;
    taxState: string;
    zipCode: string;
    referredBy: string;
    emgContact: string;
    emgPhone: string;
    municipality: string;
    notes: string;
    empStatus: number;
    isDeleted: boolean;
}



export class EmployeeList {
    empId: number;
    empName: string;
    cellPhone: string;
    empType: string;
    typeId: number;
    sSN: string;
    taxState: string;
    empKey: string;
    empStatus: number;
    hasDOB: boolean;
    hasEmail: boolean;
    managerId:number;
    coordinator: string;
    medical: boolean;
    inService: boolean;
}
