import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientEmergencyInfoComponent } from './client-emergency-info.component';

describe('ClientEmergencyInfoComponent', () => {
  let component: ClientEmergencyInfoComponent;
  let fixture: ComponentFixture<ClientEmergencyInfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ClientEmergencyInfoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientEmergencyInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
