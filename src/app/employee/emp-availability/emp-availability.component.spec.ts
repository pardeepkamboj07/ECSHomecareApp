import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmpAvailabilityComponent } from './emp-availability.component';

describe('EmpAvailabilityComponent', () => {
  let component: EmpAvailabilityComponent;
  let fixture: ComponentFixture<EmpAvailabilityComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmpAvailabilityComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmpAvailabilityComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
