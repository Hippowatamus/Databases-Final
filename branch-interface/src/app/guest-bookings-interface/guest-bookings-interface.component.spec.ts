import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GuestBookingsInterfaceComponent } from './guest-bookings-interface.component';

describe('GuestBookingsInterfaceComponent', () => {
  let component: GuestBookingsInterfaceComponent;
  let fixture: ComponentFixture<GuestBookingsInterfaceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GuestBookingsInterfaceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GuestBookingsInterfaceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
