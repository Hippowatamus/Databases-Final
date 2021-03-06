import { Component, OnInit } from '@angular/core';
import { ApiServiceService } from "../api-service.service";
import { ActivatedRoute } from "@angular/router";


@Component({
  selector: 'app-listings',
  templateUrl: './listings.component.html',
  styleUrls: ['./listings.component.css']
})

export class ListingsComponent implements OnInit {

  constructor(private apiService: ApiServiceService, private route: ActivatedRoute) { }
  data = "Nothing to display";
  ngOnInit() {
    this.getAllData();
  }

  getAllData(){
    const promise = this.apiService.getAllBranchEmployeeInfo().toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
  }



}
