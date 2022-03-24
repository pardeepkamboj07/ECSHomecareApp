import { Component, OnInit ,ViewChild} from '@angular/core';
import { TabsetComponent } from 'ngx-bootstrap/tabs';
import { setTheme } from 'ngx-bootstrap/utils';
@Component({
  selector: 'app-masterinfo',
  templateUrl: './masterinfo.component.html',
  styleUrls: [
    '../../../../assets/css/orange-blue.css',
    './masterinfo.component.scss']
})
export class MasterinfoComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
    setTheme('bs3');
  }
  @ViewChild('staticTabs', { static: false }) staticTabs?: TabsetComponent;

  selectTab(tabId: number) {
    if (this.staticTabs?.tabs[tabId]) {
      this.staticTabs.tabs[tabId].active = true;
    }
  }
}
