import { Component, OnInit } from '@angular/core';
import { EmployeeapiService } from 'src/app/Service/employeeapi.service';
import { ItemsList } from 'src/app/Model/common';
@Component({
  selector: 'app-emp-availability',
  templateUrl: './emp-availability.component.html',
  styleUrls: [
    
    '../../../assets/css/orange-blue.css',
    './emp-availability.component.scss']
})
export class EmpAvailabilityComponent implements OnInit {

  constructor(private empApi: EmployeeapiService) {
    
   }

  ngOnInit(): void {
    this.BindAvailability()
  }

  dataList = Array<ItemsList>();

    BindAvailability() {
    // this.IsLoad = true;
    debugger;
    this.empApi.getAvailabilityList().subscribe(response => {
      console.log(response.data);
      debugger;
      response.data.forEach((_obj: any) => {
        this.dataList.push(
          new ItemsList(_obj.availabilityId.toString(), _obj.availabilityName)
        );
      });
    });
  }

}
