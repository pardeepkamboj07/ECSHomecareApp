import { UserView } from 'src/app/models/common/user-view';

export class MeetingView {
    meetingId: number;
    meetingDate: string;
    startTime: string;
    endTime: string;
    meetingNote: string;
    employee: UserView;
    client: UserView;
    notes: string[];
    isStatus:number;
}


