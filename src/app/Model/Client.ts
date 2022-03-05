export class Client
{
    clientId : Number;
    billTo : string;
    firstName : string;
    middleName : string;
    lastName : string;
    clientName : string;
    cellPhone : string;
    ethnicity : string;
    email : string;
    insurenceId : string;
    ofChild : string;
    sSN : string;
    extClientId : string;
    gender : string;
    nurse : string;
    classCordinator : string;
    maritalStatus : string;
    city : string;
    country : string;
    cState : string;
    zipCode : string;
    referredBy : string;
    emgContact : string;
    caseWorkerPhone : string;
    caseWorkerEmail : string;
    isActive : Number;

    emgPhone : string;
    emgEmail : string;

    constructor(_cname : string, _extcId : string)
    {
        this.billTo = "";
        this.firstName = "";
        this.middleName = "";
        this.lastName = "";
        this.cellPhone = "";
        this.ethnicity = "";
        this.email = "";
        this.insurenceId = "";
        this.ofChild = "";
        this.sSN = "";
        this.extClientId = _extcId;
        this.gender = "";
        this.nurse = "";
        this.classCordinator = "";
        this.maritalStatus = "";
        this.city = "";
        this.country = "";
        this.cState = "";
        this.zipCode = "";
        this.referredBy = "";
        this.emgContact = "";
        this.caseWorkerPhone = "";
        this.caseWorkerEmail = "";
        this.isActive = 1;
        this.clientName = _cname;
        this.clientId = 0;

        this.emgPhone = '';
        this.emgEmail = '';
    }
}