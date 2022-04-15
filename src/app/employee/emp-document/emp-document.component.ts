import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { HttpEventType, HttpClient } from '@angular/common/http';
import { EmployeeapiService } from 'src/app/services/employeeapi.service';
import{DocumentService} from 'src/app/services/document.service';

import { ActivatedRoute, Params } from '@angular/router';
import { saveAs } from 'file-saver';
import{DeleteItem} from 'src/app/models/employee/deleteFolder';

import { FolderData } from 'src/app/models/employee/document';
import{UploadFileFolder} from 'src/app/models/employee/upload-file-folder';


@Component({
  selector: 'app-emp-document',
  templateUrl: './emp-document.component.html',
  styleUrls: [
    '../../../assets/css/orange-blue.css',
    './emp-document.component.scss']
})
export class EmpDocumentComponent implements OnInit {
  public progress: number;
  public message: string;

  @Output() public onUploadFinished = new EventEmitter();

  Deletemodel =new DeleteItem(0,0,0,0,"","");
  constructor(private route:ActivatedRoute,private http: HttpClient,private empApi: EmployeeapiService,private DocApi: DocumentService) { }
  EmpId:number;
  FolderList :any;
  ngOnInit(): void {
    this.route.params.subscribe(
      (params : Params) =>{
         this.EmpId = Number(params["empId"]);       
         this.GetFolderList(this.EmpId);

      }
    );
  }
  model=new UploadFileFolder("","",0,"","","");
  public uploadFile = (files:any) => {
    if (files.length === 0) {
      return;
    }
  
    
  
    let fileToUpload = <File>files[0];
    const formData = new FormData();
    for(let o of this.FolderList){
     
      if(o.folderId==Number(this.model.folderId))
      {
       this.model.folderName=o.folderName;
      }
     
   }
    this.model.folderId=Number(this.model.folderId);
    this.model.fileName=this.model.fileName;
    this.model.title=this.model.title;
    this.model.search=this.model.search;
    this.model.description=this.model.description;
    this.model.createdBy=1;
    formData.append('file', fileToUpload, fileToUpload.name);  
    formData.append('folderid',this.model.folderId.toString());
    formData.append('filename',fileToUpload.name);
    formData.append('Title',this.model.title);
    formData.append('Search',this.model.search);
    formData.append('Description',this.model.description);
    formData.append('CreatedBy',this.model.createdBy.toString());
    formData.append('Foldername', this.model.folderName);

    this.DocApi.UploadFile(formData).subscribe(event => {
    
      if (event.type === HttpEventType.UploadProgress)
      {
        // this.progress = Math.round(100 * event.loaded / event.total);
      }
    else if (event.type === HttpEventType.ResponseHeader) {
      this.message = 'Upload success.';
     this.cleanobj();
    } 
      });    
      
      
  }

  CreateFolder(foldername:string){
     var data=new FolderData(this.EmpId,foldername,1);
      this.DocApi.folderCreate(data).subscribe(Response=>{ 
           this.GetFolderList(this.EmpId);
         
      });
  }


  GetFolderList(empid:number){
    this.DocApi.GetFolderList(empid).subscribe(Response=>{     
     this.FolderList=Response.data;
  });
}

cleanobj(){
  this.model.folderId=0;
  this.model.fileName="";
  this.model.title="";
  this.model.search="";
  this.model.description="";
  this.model.createdBy=0;
 
}

DownloadFile(documentName:string,foldername:string)
{
  this.DocApi.DownloadFile(documentName,foldername).subscribe(data=>{
   saveAs(new Blob([data],{type:'pdf'}),documentName);
  });
}

DeleteFolder(obj:any){
  this.Deletemodel.documentId=0;
  this.Deletemodel.folderId=Number(obj.folderId);
  this.Deletemodel.folderName=obj.folderName;
  this.Deletemodel.empId=this.EmpId;
  this.Deletemodel.requestType=1;
  
  this.DocApi.DeleteFile(this.Deletemodel).subscribe(Response=>{
    this.GetFolderList(this.EmpId);
  });
}

DeleteFile(obj:any,foldername:string,folderid:number){
  this.Deletemodel.documentId=Number(obj.documentId);
  this.Deletemodel.folderId=0;
  this.Deletemodel.folderName=obj.foldername;
  this.Deletemodel.empId=this.EmpId;
  this.Deletemodel.requestType=2;
  this.Deletemodel.fileName=obj.fileName;
  this.DocApi.DeleteFile(this.Deletemodel).subscribe(Response=>{
    this.GetFolderList(this.EmpId);
  });
}



}


