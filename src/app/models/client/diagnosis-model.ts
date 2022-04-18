
import { BaseModel } from "src/app/models/common";

export class DiagnosisModel extends BaseModel {
    dxId: number;
    orderNo: number;
    isPrimary: boolean;
}