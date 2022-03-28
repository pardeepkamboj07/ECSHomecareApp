import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'equateDatePipe'
})
export class EquateDatePipePipe implements PipeTransform {


  transform(_fromDt : string,_toDt : string): boolean {
    var fromDt=new Date(_fromDt);
    fromDt.setHours(0,0,0,0);
    var toDt=new Date(_toDt);
    toDt.setHours(0,0,0,0);
 
    return (fromDt.toISOString()=== toDt.toISOString())?true:false;
  }

}
