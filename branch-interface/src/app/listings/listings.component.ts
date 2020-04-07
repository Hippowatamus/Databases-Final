import { Component, OnInit } from '@angular/core';
import { ApiServiceService } from "../api-service.service";
import { ActivatedRoute } from "@angular/router";

export interface Cat {
  name: string;
}


@Component({
  selector: 'app-listings',
  templateUrl: './listings.component.html',
  styleUrls: ['./listings.component.css']
})

export class ListingsComponent implements OnInit {

  constructor(private apiService: ApiServiceService, private route: ActivatedRoute) { }
  data = "testing 123";
  ngOnInit() {
    this.getAllData();
    
    let id: string =this.route.snapshot.paramMap.get('id');
    //this.getSpecificData(id);

  }

  getAllData(){
    const promise = this.apiService.getAllProperty().toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
  }

  // getSpecificData(id: string){
  //   const promise = this.apiService.getCat(id).toPromise();
  //   promise.then((data)=>{
  //     console.log(data);
  //     this.data = JSON.stringify(data);
  //   }, (error)=>{
  //     console.log("Promise rejected with " + JSON.stringify(error));
  //   })
  // }

}
