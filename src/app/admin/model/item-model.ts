export class ItemModel {

    
    public itemId: number;
    public masterType: number;
    public itemName: string;
    constructor(_itemId : number,_masterType : number, _itemName : string)
    {
        this.itemId = _itemId;
        this.masterType = _masterType;
        this.itemName = _itemName;
    }

}
