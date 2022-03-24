import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ColDef } from 'ag-grid-community';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { Employee } from 'src/app/Model/Employee';

@Component({
  selector: 'app-employeelist',
  templateUrl: './employeelist.component.html',
  styleUrls: [
    '../../../../assets/css/orange-blue.css',

    './employeelist.component.scss']
})
export class EmployeelistComponent implements OnInit {
  title = 'Employees List';
  searchValue = "";

  public rowData: any[] = [];
  cacheData: Employee[];

  public currentAlpha:string="All";

  constructor(private router: Router, private empapi: EmployeeapiService) {

  }

  ngOnInit(): void {
    this.empapi.getEmployeeList().subscribe(response => {
      this.rowData = this.cacheData = response.data;
      console.log(this.rowData)
    });
  }

  onClickCreateEmployee() {
    this.router.navigate(['/dashboard/saveemployee'])
  }

  
  
  quicksearch(type:any) {
    //console.log(this.searchValue);
    //this.gridApi.setQuickFilter(this.searchValue)
    if (type ==null||type =='') {
      this.cacheData = this.rowData;
    }
    else {
      var item = this.rowData.filter(o => o.empName == type);
      this.cacheData = item;
    }

  }

  GetType(type: any) {
    //var data= this.rowData.find( ({ types }) => types === type );
    if (type == 'All') {
      this.cacheData = this.rowData;
    }
    else {
      var item = this.rowData.filter(o => o.types == type);
      this.cacheData = item;
    }

  }

  GetStatus(type: any) {
    
    if (type == 'All') {
      this.cacheData = this.rowData;
    }
    else {
      var item = this.rowData.filter(o => o.isActive == type);
      this.cacheData = item;
    }
  }

  getstate(state: any) {
       
    if (state == 'All') {
      this.cacheData = this.rowData;
    }
    else {
      var item = this.rowData.filter(o => o.cState == state);
      this.cacheData = item;
    }

  }

  


  deleteEmployee(params: any) {
    
    this.empapi.deleteEmployee(params.empID).subscribe(response => {
      //this.onGridReady(params)
      let remaining = this.cacheData.filter(
        (res: any) => res.empID != params.empID
      );      
      this.cacheData= remaining;
    });
  }


  onCellClicked(event: any) {
    this.router.navigate(['/dashboard/employeeinfo/' + event.data["empID"].toString()])
  }

  AlphaFilter(alpha:any){
    this.currentAlpha=alpha;
    if (alpha == 'All') {
      this.cacheData = this.rowData;
    }
    else {
      var item = this.rowData.
       filter(o => o.empName
      .substring(0,1).toLowerCase()===alpha.toLowerCase());

      this.cacheData = item;
    }

  }

}
