import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { HttpClientModule } from "@angular/common/http";
import { ListingsComponent } from './listings/listings.component';
import { HostInterfaceComponent } from './host-interface/host-interface.component';
import { GuestInterfaceComponent } from './guest-interface/guest-interface.component';
import { BranchEmployeeInterfaceComponent } from './branch-employee-interface/branch-employee-interface.component';
import { GuestBookingsInterfaceComponent } from './guest-bookings-interface/guest-bookings-interface.component';

@NgModule({
  declarations: [
    AppComponent,
    ListingsComponent,
    HostInterfaceComponent,
    GuestInterfaceComponent,
    BranchEmployeeInterfaceComponent,
    GuestBookingsInterfaceComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
