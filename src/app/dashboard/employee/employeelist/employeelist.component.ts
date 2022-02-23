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
  columnDefs: ColDef[] = [
    { headerName: 'EMPLOYEES', field: 'empName', minWidth: 150 },
    { headerName: 'TYPES', field: 'types', minWidth: 80 },
    { headerName: 'SCHEDULE', field: '', minWidth: 120, cellRenderer: (params) => { return '<i class="fa fa-calendar fa-2x" aria-hidden="true"> </i>' } },
    { headerName: 'PHONE', field: 'cellPhone', minWidth: 150 },
    { headerName: 'EMAIL', field: 'hasDOB', minWidth: 80, cellRenderer: (params) => { return '<i class="fa fa-envelope fa-2x" aria-hidden="true"> </i>' } },
    { headerName: 'MEDICAL', field: 'hasEmail', minWidth: 100, cellRenderer: (params) => { if (params.value == 1) { return '<i class="fa fa-check fa-2x" aria-hidden="true"> </i>' } else return '<i class="fa fa-times fa-2x" aria-hidden="true"> </i>' } },
    { headerName: 'INSERVICE', field: 'hasEmail', minWidth: 110, cellRenderer: (params) => { if (params.value == 1) { return '<i class="fa fa-check fa-2x" aria-hidden="true"> </i>' } else return '<i class="fa fa-times fa-2x" aria-hidden="true"> </i>' } },
    { headerName: 'DOB', field: 'hasDOB', minWidth: 80, cellRenderer: (params) => { if (params.value == 1) { return '<i class="fa fa-check fa-2x" aria-hidden="true"> </i>' } else return '<i class="fa fa-times fa-2x" aria-hidden="true"> </i>' } },
    { headerName: 'STATUS', field: 'isActive', minWidth: 89, cellRenderer: (params) => { if (params.value == 1) { return '<i class="fa fa-check fa-2x" aria-hidden="true"> </i>' } else return '<i class="fa fa-times fa-2x" aria-hidden="true"> </i>' } },
    { headerName: 'COORDINATOR', field: 'isActive', minWidth: 150, cellRenderer: (params) => { if (params.value == 1) { return '<i class="fa fa-check fa-2x" aria-hidden="true"> </i>' } else return '<i class="fa fa-times fa-2x" aria-hidden="true"> </i>' } },
    { headerName: 'PROFILE', field: 'profile', minWidth: 90, cellRenderer: (params) => { return '<i class="fa fa-user-circle-o fa-2x" aria-hidden="true"> </i>' } },
    { headerName: 'DELETE', field: '', minWidth: 90, cellRenderer: (params) => { return '<i class="fa fa-trash fa-2x" aria-hidden="true"> </i>' }, onCellClicked: (params) => { this.deleteEmployee(params) } },
    { headerName: 'State', field: 'cState', hide: true },
  ];

  private gridApi: any;
  private gridColumnApi: any;
  searchValue = "";
  //rowData:any=  Employee[];
  public rowData: any[] = [];
  cacheData: Employee[];
  style = {
    width: '100%',
    height: '100%',
    flex: '1 1 auto'
  };

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

  onGridReady(params: any) {
    this.gridApi = params.api;
    this.gridColumnApi = params.columnApi;
    this.empapi.getEmployeeList().subscribe(response => {
      params.api.setRowData(response.data);
      this.rowData = this.cacheData = response.data;
    });
  }

  onGridSizeChanged(params: any) {

    params.api.sizeColumnsToFit();
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
    //console.log(type);
    //this.gridApi.setQuickFilter(type)
    if (type == 'All') {
      this.cacheData = this.rowData;
    }
    else {
      var item = this.rowData.filter(o => o.isActive == type);
      this.cacheData = item;
    }
  }

  getstate(state: any) {
    //console.log(state);
    // if (state == 'All') {
    //   this.gridApi.setQuickFilter('');
    // }
    // else
    //   this.gridApi.setQuickFilter(state);

    
    if (state == 'All') {
      this.cacheData = this.rowData;
    }
    else {
      var item = this.rowData.filter(o => o.cState == state);
      this.cacheData = item;
    }

  }

  getRowStyle(params: any) {
    if (params.node.rowIndex % 2 === 1) {
      return { background: '#fff' };
    }
    else
      return { background: '#C8CACB' };
  }


  deleteEmployee(params: any) {
    this.empapi.deleteEmployee(params.data.empID).subscribe(response => {
      this.onGridReady(params)
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
