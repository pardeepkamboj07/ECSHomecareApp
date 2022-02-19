import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClienteventComponent } from './clientevent.component';

describe('ClienteventComponent', () => {
  let component: ClienteventComponent;
  let fixture: ComponentFixture<ClienteventComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ClienteventComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ClienteventComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
