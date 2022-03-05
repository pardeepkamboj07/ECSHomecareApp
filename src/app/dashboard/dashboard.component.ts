import { Component, OnInit,ViewChild,TemplateRef  } from '@angular/core';
import { Router } from '@angular/router';

import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { TabsetComponent } from 'ngx-bootstrap/tabs';

import { setTheme } from 'ngx-bootstrap/utils';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: [
    '../../assets/css/orange-blue.css',
    './dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  display_client_form:boolean = false;
  display_emp_form:boolean=false;
  modalRef?: BsModalRef;

  config = {
    animated: true,
    keyboard: true,
    backdrop: true,
    ignoreBackdropClick: false,
    class: "my-modal"
  };
  constructor(private router:Router,private modalService: BsModalService) {
    setTheme('bs3');


   }

  ngOnInit(): void {
  }
  openModal(template: TemplateRef<any>) {

    this.modalRef = this.modalService.show(template, this.config);

    // this.modalRef = this.modalService.show(template, {
    //   ariaDescribedby: 'my-modal-description',
    //   ariaLabelledBy: 'my-modal-title'
    // });
  }

  openModalWithClass(template: TemplateRef<any>) {  
    this.modalRef = this.modalService.show(  
      template,  
      Object.assign({}, { class: 'gray modal-lg' })  
    );  
  } 





  messages: string[] = [];

  message(s: string) {
    this.messages.push(s);
  }

  @ViewChild('staticTabs', { static: false }) staticTabs?: TabsetComponent;

  selectTab(tabId: number) {
    if (this.staticTabs?.tabs[tabId]) {
      this.staticTabs.tabs[tabId].active = true;
    }
  }

  onClickButton(input: string){
    if(input=="client"){ 
      this.display_client_form=true;
      this.display_emp_form=false;
      this.router.navigate(['/dashboard/clientlist']);
    }
     
    if(input=="employee"){
      this.display_emp_form=true;
      this.display_client_form=false;
      this.router.navigate(['/dashboard/employeelist']);
    }

    if(input=="invoice"){
      this.display_emp_form=true;
      this.display_client_form=false;
      this.router.navigate(['/dashboard/getinvoicelist']);
    }
  }







}
