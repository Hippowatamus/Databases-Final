import { Component, OnInit } from '@angular/core';
import { ApiServiceService } from "../api-service.service";

@Component({
  selector: 'app-listings',
  templateUrl: './listings.component.html',
  styleUrls: ['./listings.component.css']
})
export class ListingsComponent implements OnInit {

  constructor(private apiService: ApiServiceService) { }

  ngOnInit() {
    console.log(this.apiService.getAllCats().toPromise());
  }

}
