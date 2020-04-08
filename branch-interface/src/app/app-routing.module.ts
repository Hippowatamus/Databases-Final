import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ListingsComponent } from "./listings/listings.component";
import { HostInterfaceComponent } from "./host-interface/host-interface.component";
import { GuestInterfaceComponent } from "./guest-interface/guest-interface.component";
import { BranchEmployeeInterfaceComponent } from './branch-employee-interface/branch-employee-interface.component';
import { GuestBookingsInterfaceComponent } from "./guest-bookings-interface/guest-bookings-interface.component";

const routes: Routes = [
  {path: '', redirectTo: '/branchemployee', pathMatch: 'full'},
  {path: 'branchemployee', component: ListingsComponent},
  {path: 'branchemployee/:id', component: BranchEmployeeInterfaceComponent},
  {path: 'guest', component: GuestInterfaceComponent},
  {path: 'host/:id', component: HostInterfaceComponent},
  {path: 'guest/:id', component: GuestBookingsInterfaceComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
