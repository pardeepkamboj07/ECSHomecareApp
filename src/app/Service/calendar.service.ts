import { Injectable } from '@angular/core';
import { Day } from '../Model/Day';

@Injectable({
  providedIn: 'root'
})
export class CalendarService {

  private currentYear: number;
  private currentMonthIndex: number;
  private currentDay: number;

  constructor() {
    let date = new Date();
    //console.log(date);
    this.currentYear = date.getFullYear();
    this.currentMonthIndex = date.getMonth(); 
    this.currentDay = date.getDay();
  }

  public getCurrentMonth(): Day[] {
    return this.getMonth(this.currentMonthIndex, this.currentYear);
  }

  public getMonth(monthIndex: number, year: number): Day[] {
    let days = [];

    let firstday = this.createDay(1, monthIndex, year);

    //create empty days
    for (let i = 1; i < firstday.weekDayNumber; i++) {
      days.push({
        weekDayNumber: i,
        monthIndex: monthIndex,
        year: year,
      } as Day);
    }
    days.push(firstday);
    //

    let countDaysInMonth = new Date(year, monthIndex +1, 0).getDate();
    for (let i = 2; i < countDaysInMonth +1; i++) {
      days.push(this.createDay(i, monthIndex, year));
    }

    return days;
  }

  public getMonthName(monthIndex: number): string {
    switch (monthIndex) {
      case 0:
        return "January";      
      case 1:
        return "February";
      case 2:
        return "March";
      case 3:
        return "April";
      case 4:
        return "May";
      case 5:
        return "June";
      case 6:
        return "July";
      case 7:
        return "August";
      case 8:
        return "September";
      case 9:
        return "October";
      case 10:
        return "November";
      case 11:
        return "December";

      default:
        return "";
    }
  }

  public getWeekDayName(weekDay: number): string {
    switch (weekDay) {
      case 0:
        return "Sun"; // Sunday
      case 1:
        return "Mon"; // Monday
      case 2:
        return "Tue"; // Tuesday
      case 3:
        return "Wed"; // Wednesday
      case 4:
        return "Thu"; // Thursday
      case 5:
        return "Fri"; // Friday
      case 6:
        return "Sat"; // Saturday

      default:
        return "";
    }
  }

  private createDay(dayNumber: number, monthIndex: number, year: number) {
    let day = new Day();

    day.monthIndex = monthIndex;
    day.month = this.getMonthName(monthIndex);

    day.number = dayNumber;
    day.year = this.currentYear;

    day.weekDayNumber = new Date(year, monthIndex, dayNumber).getDay();
    day.weekDayName = this.getWeekDayName(day.weekDayNumber);

    return day;
  }
}
