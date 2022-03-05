import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginPageComponent } from './login-page/login-page.component';
import { LayoutComponent } from './layout/layout.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { MaincontentComponent } from './dashboard/maincontent/maincontent.component';
import { EmployeelistComponent } from './dashboard/employee/employeelist/employeelist.component';
import { ClientlistComponent } from './dashboard/client/clientlist/clientlist.component';
import { SaveemployeeComponent } from './dashboard/employee/saveemployee/saveemployee.component';
import { SaveclientComponent } from './dashboard/client/saveclient/saveclient.component';
import { ClienteventComponent } from './dashboard/client/clientevent/clientevent.component';
import { GenerateinvoiceComponent } from './dashboard/generateinvoice/generateinvoice.component';
import { GetinvoicesComponent } from './dashboard/getinvoices/getinvoices.component';
import { InvoicedetailsComponent } from './dashboard/invoicedetails/invoicedetails.component';
import { ClientInfoComponent } from './dashboard/client/client-info/client-info.component';
import { EmployeeInfoComponent } from './dashboard/employee/employee-info/employee-info.component';
import { ClientCalenderComponent } from './client-calender/client-calender.component';

const routes: Routes = [
  
  {
    path : 'login',component : LoginPageComponent 
  },
  {
    path : 'CalList',component : ClientCalenderComponent 
  },

  {
    path : 'Layout',component : LayoutComponent 
   
  },

  {
    path : 'dashboard',component :  LayoutComponent,
     children : [{path:'',component:DashboardComponent}]
  },
  {
    path : 'employee',component : LayoutComponent ,
     children : [{path:'',component:SaveemployeeComponent}]
  },
  {
    path : 'employeeList',component : LayoutComponent ,
     children : [{path:'',component:EmployeelistComponent}]
  },
  {
    path : 'Layout',component : LayoutComponent ,
     children : [{path:'employeeinfo/:eId',component:EmployeeInfoComponent}]
  },
  {
    path : 'Layout',component : LayoutComponent,
     children : [{path:'generateinvoice',component:GenerateinvoiceComponent}]
  },
  {
    path : 'Layout',component : LayoutComponent,
     children : [{path:'getinvoicelist',component:GetinvoicesComponent}]
  },
  {
    path : 'Layout',component : LayoutComponent ,
     children : [{path:'getinvoicebyId/:InvId',component:InvoicedetailsComponent}]
  },
  {
    path : 'Layout',component : LayoutComponent ,
     children : [{path:'clientevent/:clientId',component:ClienteventComponent}]
  },
  
  {
    path : 'Layout',component : LayoutComponent ,
     children : [{path:'clientlist',component:ClientlistComponent}]
  },
  {
    path : 'Layout',component : LayoutComponent ,
     children : [{path:'clientinfo/:cId',component:ClientInfoComponent}]
  },
  
  {
    path : 'Layout',component : LayoutComponent ,
     children : [{path:'saveclient',component:SaveclientComponent}]
  }, 
  { path: '', component: LoginPageComponent },
  { path: '**', component: LoginPageComponent },
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
