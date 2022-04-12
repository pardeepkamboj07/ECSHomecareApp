import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientMedicationcsComponent } from './client-medicationcs.component';

describe('ClientMedicationcsComponent', () => {
  let component: ClientMedicationcsComponent;
  let fixture: ComponentFixture<ClientMedicationcsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ClientMedicationcsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientMedicationcsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
