import { BaseModel } from 'src/app/models/common';

export class ComplianceObj extends BaseModel {


    public complianceId: number;
    public empId: number;
    public nurse: number;
    public dueDate: string;
    public completedOn: string;
    public category: string;
    public code: string;
    public result: string;
   
    public notes: string;
    

    constructor(_complianceId : number, _empId : number,nurse : number, _dueDate : string, _completedOn : string, category : string, 
        code : string, result : string,  notes : string)
    {
        super();
        this.complianceId = _complianceId;
        this.empId = _empId;
        this.dueDate = _dueDate;
        this.completedOn = _completedOn;     
        this.category = category;
        this.code = code;
        this.result = result;
        this.nurse = nurse;
        this.notes = notes;
       
    }






}
