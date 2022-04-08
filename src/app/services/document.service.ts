import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders ,HttpParams } from '@angular/common/http'; 
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';
import { APIResponse } from '../models/APIResponse';
import { ItemsList,SelectList } from 'src/app/models/common';
import { ItemModel } from 'src/app/admin/model/item-model';
import { FolderData } from '../models/Employee/Document';
import{Deleteitem} from'../models/Employee/DeleteFolder'

@Injectable({
  providedIn: 'root'
})
export class DocumentService {

  constructor(private _http : HttpClient) { }

  
  
  folderCreate(data:FolderData){
    var headers_object = new HttpHeaders();
    headers_object.append('Content-Type', 'application/json');
    var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
    const httpOptions = {
      headers: headers_object
    }; 
  return this._http.post(environment.domain + "/api/Document/SaveFolder", data,httpOptions);      
  }
  
  GetFolderList(empId:number){
   
    return this._http.get<APIResponse<ItemsList[]>>(environment.domain + "/api/Document/getDocumentlist" + '/' + empId);
  }
  
  DownloadFile(documentName:string,foldername:string){ 
    const Req_param=new HttpParams().set('foldername',foldername);
   return this._http.get(environment.domain+ "/api/Document/download"+ '/' + documentName,{
      params:Req_param,
      responseType:'arraybuffer'
    });  
  }


  UploadFile(formData:FormData)
  {    
    var headers_object = new HttpHeaders();  
    headers_object.append('Content-Type', 'text/plain;charset=UTF-8');  
    var headers_object = new HttpHeaders().set("Authorization", "Bearer " + "qatest");
    const httpOptions = {
      headers: headers_object
    }; 
    return this._http.post(environment.domain + "/api/Document/UploadFile", formData,{reportProgress: true, observe: 'events'},);  
  
  }


  DeleteFile(obj:Deleteitem){
   
    var headers_object = new HttpHeaders();
    const Req_param=new HttpParams({
      fromObject:{
        'DocumentId':Number(obj.DocumentId),
        'FileName':obj.FileName,
        'FolderId':Number(obj.FolderId),
        'FolderName':obj.FolderName,
        'empid':Number(obj.EmpId)
      }
    });
   
  return this._http.delete(environment.domain + "/api/Document/DeletetDocumentFromS3",{params:Req_param});
  }

}
