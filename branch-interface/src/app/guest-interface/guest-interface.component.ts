import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { ApiServiceService } from "../api-service.service";


@Component({
  selector: 'app-guest-interface',
  templateUrl: './guest-interface.component.html',
  styleUrls: ['./guest-interface.component.css']
})
export class GuestInterfaceComponent implements OnInit {

  constructor(private route: ActivatedRoute, private apiService: ApiServiceService) { }
  data = "Nothing to display";
  ngOnInit() {
    this.getAllGuestInfo()
  }

  getAllGuestInfo(){
    const promise = this.apiService.getAllGuestInfo().toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
  }

}
