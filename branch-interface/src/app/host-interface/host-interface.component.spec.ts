import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HostInterfaceComponent } from './host-interface.component';


describe('HostInterfaceComponent', () => {
  let component: HostInterfaceComponent;
  let fixture: ComponentFixture<HostInterfaceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HostInterfaceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HostInterfaceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
