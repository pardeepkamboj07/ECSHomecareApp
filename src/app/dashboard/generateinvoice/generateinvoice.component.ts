import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { GenerateInvoice } from 'src/app/models/generate-invoice';
import { InvoiceService } from 'src/app/services/invoice.service'; 
import { ToastrManager } from 'ng6-toastr-notifications';

@Component({
  selector: 'app-generateinvoice',
  templateUrl: './generateinvoice.component.html',
  styleUrls: [
    
    '../../../assets/css/orange-blue.css',
    './generateinvoice.component.scss']
})
export class GenerateinvoiceComponent implements OnInit {

  invoice : GenerateInvoice;

  constructor(private router:Router,private invoiceapi : InvoiceService,public toastr: ToastrManager) { }

  ngOnInit(): void {
    this.invoice = new GenerateInvoice();
  }

  
  OnSubmit(form : NgForm)
  {
    
    this.GenerateInvoice(form);
  }

  GenerateInvoice(form : NgForm)
  {
    if(form.value["txtdesc"].length > 5)
    {
      if(form.value["txtAmt"].length > 0)
      {
        this.invoice.description = form.value["txtdesc"];
        this.invoice.custId = "cus_Kx5m4PjePgXSxK";
        this.invoice.amount = form.value["txtAmt"];

      this.invoiceapi.generateinvoice(this.invoice).subscribe(
        (response)=>
        {
          this.toastr.successToastr('Invoice created.', 'Success!');
          this.router.navigate(['/invoice/list'])
        },
        (error)=> {
          console.log(error);
        }
        )      
      }
      else
      {
        this.toastr.errorToastr('Enter Amount.', 'Oops!');  
      }
    }
    else
    {
      this.toastr.errorToastr('Enter Description of minimum 5 chars.', 'Oops!');
    }
    

  }

}
