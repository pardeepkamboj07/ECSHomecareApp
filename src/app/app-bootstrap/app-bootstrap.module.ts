import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { ModalModule } from 'ngx-bootstrap/modal';
import { CollapseModule} from 'ngx-bootstrap/collapse';
<<<<<<< HEAD
import { TabsModule,TabsetConfig } from 'ngx-bootstrap/tabs';
=======



>>>>>>> fa55f335617a561697966b07e9ceab36d017fc64
@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    BsDropdownModule.forRoot(),
    TooltipModule.forRoot(),
    ModalModule.forRoot(),
    CollapseModule.forRoot(),
<<<<<<< HEAD
    TabsModule.forRoot()
=======

>>>>>>> fa55f335617a561697966b07e9ceab36d017fc64
  ],
  exports: [BsDropdownModule, TooltipModule, ModalModule]
})

export class AppBootstrapModule { }

