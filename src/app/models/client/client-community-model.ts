import { BaseModel } from "../common";

export class ClientCommunityMaster extends BaseModel {
    communityId: number;
    communityName: string;
    communityAddress: string;
    communityFloor: string;
    county: string;
    state: string;
    city: string;
    contact: string;
    email: string;
    notes: string;
}