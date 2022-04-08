export class Incident {
    public incidentId: number;
    public empId: number;
    public clientId: number;
    public incidentDate: string;
    public incidentDetail: string;
    constructor(_incidentId : number, _empId : number, _clientId : number, _incidentDate : string, _incidentDetail : string)
    {
        this.incidentId = _incidentId;
        this.empId = _empId;
        this.clientId = _clientId;
        this.incidentDate = _incidentDate;     
        this.incidentDetail = _incidentDetail;
    }
}