import { Component, OnInit, Pipe, PipeTransform } from '@angular/core';
import { CalendarDay } from '../Model/calendar-day';
import { Router,ActivatedRoute, Params } from '@angular/router';
import { MeetingService } from 'src/app/services/meeting.service';
import { Empmeeting } from 'src/app/Model/Meeting/empmeeting';
import { DatePipe } from '@angular/common';
@Pipe({
  name: 'chunk'
})
export class ChunkPipe implements PipeTransform {

  transform(calendarDaysArray: any, chunkSize: number): any {
    let calendarDays:any = [];
    let weekDays:any = [];

    calendarDaysArray.map((day:any,index:any) => {
        weekDays.push(day);
        if (++index % chunkSize  === 0) {
          calendarDays.push(weekDays);
          weekDays = [];
        }
    });
    return calendarDays;
  }
}

@Component({
  selector: 'app-client-calender',
  templateUrl: './client-calender.component.html',
  styleUrls: [
    '../../assets/css/orange-blue.css',    
    './client-calender.component.scss']
})

export class ClientCalenderComponent implements OnInit {
  public calendar: CalendarDay[] = [];
  public monthNames = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];
  constructor(private router:Router, 
    private route:ActivatedRoute,private momApi:MeetingService,public datepipe: DatePipe) { }

  public displayMonth: string;
  private monthIndex: number = 0;
  private empId:number=1;
   meetingList: Empmeeting[];
  ngOnInit(): void {

    this.route.params
    .subscribe(
      (params : Params) =>{
        this.empId = params["eId"];
      }
    );


    this.momApi.getEmployeeMeeting(1).subscribe((response) => {
      this.meetingList = response.data;
      this.generateCalendarDays(this.monthIndex,this.empId);
    });

    
  }

  private generateCalendarDays(monthIndex: number,empId:number): void {
    // we reset our calendar
    this.calendar = [];
    // we set the date 
    let day: Date = new Date(new Date().setMonth(new Date().getMonth() + monthIndex));

    // set the dispaly month for UI
    this.displayMonth = this.monthNames[day.getMonth()];

    let startingDateOfCalendar = this.getStartDateForCalendar(day);

    let dateToAdd = startingDateOfCalendar;

    for (var i = 0; i < 42; i++) {

debugger;




let _cdate=new Date(dateToAdd);

let dateObj=this.datepipe.transform(dateToAdd,"yyyy-MM-dd");



let _meeting = this.meetingList.filter((x: Empmeeting) =>(this.datepipe.transform(x.meetingDate,"yyyy-MM-dd")===dateObj));

console.log(_meeting);


      this.calendar.push(new CalendarDay(_cdate,_meeting));
      dateToAdd = new Date(dateToAdd.setDate(dateToAdd.getDate() + 1));
    }
  }

  BindMaster()
  { 
    this.momApi.getEmployeeMeeting(1).subscribe((response) => {
      this.meetingList = response.data;
    });

  }
//   isValidDate:boolean;

//   equalDates(sDate: string, eDate: string){
//     this.isValidDate = false;
// if(new Date(sDate).getTime()===new Date(eDate).getTime())
// {
//   this.isValidDate = true;
// }
//     //YYYY-MM-DD
    
//   }

//tru



  private getStartDateForCalendar(selectedDate: Date){
    // for the day we selected let's get the previous month last day
    let lastDayOfPreviousMonth = new Date(selectedDate.setDate(0));

    // start by setting the starting date of the calendar same as the last day of previous month
    let startingDateOfCalendar: Date = lastDayOfPreviousMonth;

    // but since we actually want to find the last Monday of previous month
    // we will start going back in days intil we encounter our last Monday of previous month
    if (startingDateOfCalendar.getDay() != 1) {
      do {
        startingDateOfCalendar = new Date(startingDateOfCalendar.setDate(startingDateOfCalendar.getDate() - 1));
      } while (startingDateOfCalendar.getDay() != 1);
    }

    return startingDateOfCalendar;
  }

   public increaseMonth() {
    this.monthIndex++;
    this.generateCalendarDays(this.monthIndex,this.empId);
  }

  public decreaseMonth() {
    this.monthIndex--
    this.generateCalendarDays(this.monthIndex,this.empId);
  }

  public setCurrentMonth() {
    this.monthIndex = 0;
    this.generateCalendarDays(this.monthIndex,this.empId);
  }


}
