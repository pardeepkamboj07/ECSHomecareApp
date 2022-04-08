export class Employee
{
    empID : Number;
    empName : string;
    coordinator : string;
    hasEmail : string;
    hasDOB : string;
    types : string;
    employeeId : Number;
    firstName : string;
    middleName : string;
    lastName : string;
    cellPhone : string;
    homePhone : string;
    email : string;
    dateOfHire : string;
    dateOfFirstCase : string;
    dOB : string;
    sSN : string;
    extEmpId : string;
    gender : string;
    hRSupervisor : string;
    enthnicity : string;
    maritalStatus : string;
    city : string;
    country : string;
    cState : string;
    zipCode : string;
    referredBy : string;
    emgContact : string;
    emgPhone : string;
    isActive : Number;
  status: string;

    constructor()
    {
        this.types = "HHA";
        this.coordinator = "NA";
        this.empID = 0;
        this.empName = "";
        this.hasEmail = "";
        this.hasDOB = "";
        this.employeeId = 0;
        this.firstName = "";
        this.middleName = "";
        this.lastName = "";
        this.cellPhone = "";
        this.homePhone = "";
        this.email = "";
        this.dateOfHire = "";
        this.dateOfFirstCase = "";
        this.dOB = "";
        this.sSN = "";
        this.extEmpId = "";
        this.gender = "";
        this.hRSupervisor = "";
        this.enthnicity = "";
        this.maritalStatus = "";
        this.city = "";
        this.country = "";
        this.cState = "";
        this.zipCode = "";
        this.referredBy = "";
        this.emgContact = "";
        this.emgPhone = "";
        this.isActive = 1;
    }
}