export class UploadFileFolder
{
  public  Title :string;
   public folderid :number;
   public Search:string;
   public Description:string;
   public filename:string;
   public Foldername:string;
    public  CreatedBy :number;
    constructor(_Title:string,_Search:string,_folderid:number,_Description:string,_filename:string,_Foldername:string)
    {
        this.Title=_Title;
        this.Search=_Search;
       this.folderid=_folderid;
       this.Description=_Description;
       this.filename=_filename;
       this.Foldername=_filename;
    }
}