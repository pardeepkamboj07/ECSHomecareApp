export class ItemsList {
    public itemId: number;
    public itemName: string;
    constructor(_itemId : number, _itemName : string)
    {
        this.itemId = _itemId;
        this.itemName = _itemName;
    }
}



  export class SelectList {
    public itemCode: string;
    public itemName: string;
    constructor(_itemCode : string, _itemName : string)
    {
        this.itemCode = _itemCode;
        this.itemName = _itemName;
    }
}

export enum MasterType {
    Status = 1,
    MaritalStatus,
    Gender,
    Ethnicity,
    EmpStatusType,
  }


  export enum StatusEnum {
    Deleted = 0,
    Active,
    Cancelled,
    CancelledByClient,
    
  }


 
