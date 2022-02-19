import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SaveclientComponent } from './saveclient.component';

describe('SaveclientComponent', () => {
  let component: SaveclientComponent;
  let fixture: ComponentFixture<SaveclientComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SaveclientComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SaveclientComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
