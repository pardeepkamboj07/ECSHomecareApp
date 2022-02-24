import { Component, OnInit,TemplateRef } from '@angular/core';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
@Component({
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: [
    '../../assets/css/orange-blue.css',
    '../../assets/css/style-responsive.css',  
    './layout.component.css']
})
export class LayoutComponent implements OnInit {


  navbarCollapsed = true;
  public modalRef: BsModalRef;
  constructor(private modalService: BsModalService) {}

  ngOnInit(): void {
  }
  public openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template);
  }

toggleNavbarCollapsing() {
    this.navbarCollapsed = !this.navbarCollapsed;
}

}
