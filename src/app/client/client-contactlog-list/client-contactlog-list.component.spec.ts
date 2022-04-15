import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientContactlogListComponent } from './client-contactlog-list.component';

describe('ClientContactlogListComponent', () => {
  let component: ClientContactlogListComponent;
  let fixture: ComponentFixture<ClientContactlogListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ClientContactlogListComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientContactlogListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
