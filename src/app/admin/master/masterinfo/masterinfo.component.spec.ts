import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MasterinfoComponent } from './masterinfo.component';

describe('MasterinfoComponent', () => {
  let component: MasterinfoComponent;
  let fixture: ComponentFixture<MasterinfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MasterinfoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MasterinfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
