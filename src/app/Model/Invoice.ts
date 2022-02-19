import { Lines } from 'src/app/Model/Lines';

export class Invoice
{
    id :  string;
    accountName : string;
    amountRemaining : Number;
    created : string;
    currency : string;
    customerId : string;
    customerEmail : string;
    paid : boolean;
    status : string;
    total : Number;
    lines : Lines[];

    constructor()
    {
        this.id = "";
        this.accountName = "";
        this.amountRemaining = 0;
        this.created = "";
        this.currency = "";
        this.customerEmail = "";
        this.customerId = "";
        this.paid = false;
        this.status = "";
        this.total = 0;
    }
}