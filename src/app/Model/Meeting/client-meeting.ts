export class ClientMeeting {
    clientId: number;
    firstName: string;
    middleName: string;
    lastName: string;
    contact: string;
    meetings: ClMeeting[];
}

export class ClMeeting {
    empId: number;
    empName: string;
    meetingId: number;
    meetingDate: string;
    startTime: string;
    endTime: string;
    meetingNote: string;
}