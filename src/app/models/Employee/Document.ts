export class FolderData
    {
      public  EmpId :number;
       public FolderName :string;        
        public  CreatedBy :number;
        constructor(_emp:number,_folder:string,_Createdby:number)
        {
            this.EmpId=_emp;
            this.FolderName=_folder;
           this.CreatedBy=_Createdby;
        }
    }


   