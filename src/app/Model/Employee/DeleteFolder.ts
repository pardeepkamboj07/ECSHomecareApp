export class Deleteitem
{
  public  EmpId :number;
   public FolderId :number;        
    public  DocumentId :number;
    public  RequestType :number;
    public  FileName :string;
    public  FolderName :string;

    constructor(_emp:number,_folderId:number,_documentId:number,_RequestType:number,_fileName:string,_FolderName:string)
    {
        this.EmpId=_emp;
        this.FolderId=_folderId;
       this.DocumentId=_documentId;
       this.RequestType=_RequestType;
       this.FileName=_fileName;
       this.FolderName=_FolderName
    }
}
