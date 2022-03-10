import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmpIncidentsComponent } from './emp-incidents.component';

describe('EmpIncidentsComponent', () => {
  let component: EmpIncidentsComponent;
  let fixture: ComponentFixture<EmpIncidentsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmpIncidentsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmpIncidentsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
