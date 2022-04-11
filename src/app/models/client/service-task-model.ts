import { BaseModel } from 'src/app/models/common';

export class TaskModel extends BaseModel {
    taskId: number;
    taskCode: string;
    taskName: string;
    taskDetail: number;
}

export class ServiceTaskModel extends BaseModel {
    taskSrvId: number;
    taskId: number;
    frequency: number;
    serviceNote: string;
}

export class ServiceTaskView {
    taskSrvId: number;
    userId: number;
    taskCode: string;
    taskName: string;
    frequency: number;
    serviceNote: string;
}
