import { UserView } from 'src/app/Model/common/user-view';

export class MeetingView {
    meetingId: number;
    meetingDate: string;
    startTime: string;
    endTime: string;
    meetingNote: string;
    employee: UserView;
    client: UserView;
    notes: string[];
}


