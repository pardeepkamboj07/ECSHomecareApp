export class FolderData
    {
      public  empId :number;
       public folderName :string;        
        public  createdBy :number;
        constructor(_emp:number,_folder:string,_Createdby:number)
        {
            this.empId=_emp;
            this.folderName=_folder;
           this.createdBy=_Createdby;
        }
    }


   