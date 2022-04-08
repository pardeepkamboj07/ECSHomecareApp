export class Attendance {
    public attendanceId: number;
    public empId: number;
    public reason: string;
    public startDate: string;
    public endDate: string;
    public notes: string;
    constructor(_attendanceId : number, _empId : number, _reason : string, _startDate : string, _endDate : string, _notes : string)
    {
        this.attendanceId = _attendanceId;
        this.empId = _empId;
        this.reason = _reason;
        this.startDate = _startDate;     
        this.endDate = _endDate;
        this.notes = _notes;
    }
}


