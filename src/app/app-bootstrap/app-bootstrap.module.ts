import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { ModalModule } from 'ngx-bootstrap/modal';
import { CollapseModule} from 'ngx-bootstrap/collapse';
import { TabsModule,TabsetConfig } from 'ngx-bootstrap/tabs';
@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    BsDropdownModule.forRoot(),
    TooltipModule.forRoot(),
    ModalModule.forRoot(),
    CollapseModule.forRoot(),
    TabsModule.forRoot()
  ],
  exports: [BsDropdownModule, TooltipModule, ModalModule]
})

export class AppBootstrapModule { }

