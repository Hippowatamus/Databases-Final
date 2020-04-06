import { Component, OnInit } from '@angular/core';
import { ApiServiceService } from "../api-service.service";

export interface Cat {
  name: string;
}


@Component({
  selector: 'app-listings',
  templateUrl: './listings.component.html',
  styleUrls: ['./listings.component.css']
})

export class ListingsComponent implements OnInit {

  constructor(private apiService: ApiServiceService) { }
  data = "testing 123";
  ngOnInit() {
    //this.test = this.apiService.getAllCats().toPromise().toString();
    //this.apiService.getAllCats
    //while(this.data.length==0){}
    console.log(this.apiService.getAllCats().toPromise());
    const promise = this.apiService.getAllCats().toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
  }


  

}
