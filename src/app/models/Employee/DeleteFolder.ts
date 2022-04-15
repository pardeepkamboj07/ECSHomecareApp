
export class DeleteItem 
{
  public  empId :number;
   public folderId :number;        
    public  documentId :number;
    public  requestType :number;
    public  fileName :string;
    public  folderName :string;

    constructor(_emp:number,_folderId:number,_documentId:number,_RequestType:number,_fileName:string,_FolderName:string)
    {
        this.empId=_emp;
        this.folderId=_folderId;
       this.documentId=_documentId;
       this.requestType=_RequestType;
       this.fileName=_fileName;
       this.folderName=_FolderName
    }
}
