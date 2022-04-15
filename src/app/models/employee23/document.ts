import { BaseModel } from 'src/app/models/common';

export class FolderData extends BaseModel
    {
      public  empId :number;
       public folderName :string;        
      
        constructor(_emp:number,_folder:string)
        {
            super();
            this.empId=_emp;
            this.folderName=_folder;
      
        }
    }


   
