import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'equateDate'
})
export class EquateDatePipe implements PipeTransform {


  transform(_fromDt : string,_toDt : string): boolean {
    var fromDt=new Date(_fromDt);
    fromDt.setHours(0,0,0,0);
    var toDt=new Date(_toDt);
    toDt.setHours(0,0,0,0);
 
    return (fromDt.toISOString()=== toDt.toISOString())?true:false;
  }
}

export class TimePipePipe implements PipeTransform {


  transform(_hours : number,_minutes : number): string {


    if(_hours>12)
    {

    }
 
    return "";
  }

}



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

