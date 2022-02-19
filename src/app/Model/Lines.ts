export class Lines
{
    id : string;
    description : string;
    currency : string;
    amount : Number;
    
    constructor()
    {
        this.id = "";
        this.amount = 0;
        this.currency = "";
        this.description = "";
    }
}