import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ClientCommunityComponent } from './client-community.component';

describe('ClientCommunityComponent', () => {
  let component: ClientCommunityComponent;
  let fixture: ComponentFixture<ClientCommunityComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ClientCommunityComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ClientCommunityComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
