export class APIResponse<T>
{
    data : T;
    message : any;
    result : boolean;

    constructor()
    {
        this.result = false;
    }
}