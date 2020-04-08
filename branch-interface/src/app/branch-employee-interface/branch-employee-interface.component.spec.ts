import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BranchEmployeeInterfaceComponent } from './branch-employee-interface.component';

describe('BranchEmployeeInterfaceComponent', () => {
  let component: BranchEmployeeInterfaceComponent;
  let fixture: ComponentFixture<BranchEmployeeInterfaceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BranchEmployeeInterfaceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BranchEmployeeInterfaceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
