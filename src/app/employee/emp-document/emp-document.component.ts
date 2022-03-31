import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { HttpEventType, HttpClient } from '@angular/common/http';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import{CommonService} from 'src/app/services/common.service';
import { FolderData } from 'src/app/Model/Employee/Document';
import{UploadFileFolder} from 'src/app/Model/Employee/UploadFileFolder';
import { ActivatedRoute, Params } from '@angular/router';
import { saveAs } from 'file-saver';


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
  constructor(private route:ActivatedRoute,private http: HttpClient,private empApi: EmployeeapiService,private CommApi: CommonService) { }
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
    debugger;
    
    
  
    let fileToUpload = <File>files[0];
    const formData = new FormData();
    for(let o of this.FolderList){
      debugger
      if(o.folderId==Number(this.model.folderid))
      {
       this.model.Foldername=o.folderName;
      }
     
   }
    this.model.folderid=Number(this.model.folderid);
    this.model.filename=this.model.filename;
    this.model.Title=this.model.Title;
    this.model.Search=this.model.Search;
    this.model.Description=this.model.Description;
    this.model.CreatedBy=1;
    formData.append('file', fileToUpload, fileToUpload.name);  
    formData.append('folderid',this.model.folderid.toString());
    formData.append('filename',fileToUpload.name);
    formData.append('Title',this.model.Title);
    formData.append('Search',this.model.Search);
    formData.append('Description',this.model.Description);
    formData.append('CreatedBy',this.model.CreatedBy.toString());
    formData.append('Foldername', this.model.Foldername);

    this.empApi.UploadFile(formData).subscribe(event => {
      debugger
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
      this.CommApi.folderCreate(data).subscribe(Response=>{ 
           this.GetFolderList(this.EmpId);
         
      });
  }


  GetFolderList(empid:number){
    this.CommApi.GetFolderList(empid).subscribe(Response=>{

     this.FolderList=Response.data;   
     
  });
}

cleanobj(){
  this.model.folderid=0;
  this.model.filename="";
  this.model.Title="";
  this.model.Search="";
  this.model.Description="";
  this.model.CreatedBy=0;
 
}

DownloadFile(documentName:string,foldername:string)
{

  this.CommApi.DownloadFile(documentName,foldername).subscribe(data=>{
   saveAs(new Blob([data],{type:'pdf'}),documentName);
  });
}

}
