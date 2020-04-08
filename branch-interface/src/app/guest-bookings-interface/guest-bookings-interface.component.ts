import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { ApiServiceService } from "../api-service.service";

@Component({
  selector: 'app-guest-bookings-interface',
  templateUrl: './guest-bookings-interface.component.html',
  styleUrls: ['./guest-bookings-interface.component.css']
})
export class GuestBookingsInterfaceComponent implements OnInit {

  constructor(private route: ActivatedRoute, private apiService: ApiServiceService) { }
  data = "Nothing to display";
  ngOnInit() {
    let id: string =this.route.snapshot.paramMap.get('id');
    this.getSpecificData(id);
  }

  getSpecificData(id: string){
    const promise = this.apiService.getGuestBookingInfo(id).toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
  }
}
