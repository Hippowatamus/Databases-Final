import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ListingsComponent } from "./listings/listings.component";
import { HostInterfaceComponent } from "./host-interface/host-interface.component";
import { GuestInterfaceComponent } from "./guest-interface/guest-interface.component";

const routes: Routes = [
  {path: '', redirectTo: '/branchemployee', pathMatch: 'full'},
  {path: 'branchemployee', component: ListingsComponent},
  {path: 'branchemployee/:id', component: ListingsComponent},
  {path: 'guest', component: GuestInterfaceComponent},
  {path: 'host', component: HostInterfaceComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
