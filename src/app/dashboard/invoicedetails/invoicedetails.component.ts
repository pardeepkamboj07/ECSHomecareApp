import { Component, OnInit } from '@angular/core';
import { InvoiceService } from 'src/app/services/invoice.service'; 
import { Invoice } from 'src/app/models/Invoice';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { ToastrManager } from 'ng6-toastr-notifications';

@Component({
  selector: 'app-invoicedetails',
  templateUrl: './invoicedetails.component.html',
  styleUrls: [
    
    '../../../assets/css/orange-blue.css',
    './invoicedetails.component.scss']
})
export class InvoicedetailsComponent implements OnInit {

  invoicedetails : Invoice;
  InvId : string;

  constructor(private routers:Router,private router:ActivatedRoute, private invoiceapi : InvoiceService, public toastr: ToastrManager) { }

  ngOnInit(): void {
    this.router.params
    .subscribe(
      (params : Params) =>{
        this.InvId = params["InvId"];
      }
    );
    this.Getinvoicedetails(this.InvId);
  }

  Getinvoicedetails(invId : string)
  {
    this.invoiceapi.getInvoicebyId(invId).subscribe(response => {
          this.invoicedetails = response.data;
        }); 
  }

  PayInvoice()
  {
    this.invoiceapi.payinvoice(this.InvId).subscribe(response => {
      this.toastr.successToastr('Invoice Paid Successfully.', 'Success!');
      this.routers.navigate(['/invoice/list'])
    }); 
  }
}
