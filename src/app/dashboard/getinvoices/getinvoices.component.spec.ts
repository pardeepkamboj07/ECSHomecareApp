import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GetinvoicesComponent } from './getinvoices.component';

describe('GetinvoicesComponent', () => {
  let component: GetinvoicesComponent;
  let fixture: ComponentFixture<GetinvoicesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GetinvoicesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GetinvoicesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
