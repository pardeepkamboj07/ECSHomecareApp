import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientCalenderComponent } from './client-calender.component';

describe('ClientCalenderComponent', () => {
  let component: ClientCalenderComponent;
  let fixture: ComponentFixture<ClientCalenderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ClientCalenderComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientCalenderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
