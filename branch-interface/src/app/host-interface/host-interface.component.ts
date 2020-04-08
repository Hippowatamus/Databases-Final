import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { ApiServiceService } from "../api-service.service";
import { Branch } from "../api-service.service";
@Component({
  selector: 'app-host-interface',
  templateUrl: './host-interface.component.html',
  styleUrls: ['./host-interface.component.css']
})
export class HostInterfaceComponent implements OnInit {

  constructor(private route: ActivatedRoute, private apiService: ApiServiceService) { }

  data = "Nothing to display";
  branch = <Branch>{ branch_country: "USA"};
  ngOnInit() {
    let id: string =this.route.snapshot.paramMap.get('id');
    this.getSpecificData(id);
    //this.postBranch(id);
    //this.deleteProperty(id)
  }

  getSpecificData(id: string){
    const promise = this.apiService.getAllHostInfo(id).toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
  }

  postBranch(id: string){
    console.log("about to post branch from host interface"+this.branch.branch_country)
    const promise = this.apiService.insertBranch(id, this.branch).toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
    //this.apiService.insertBranch(id, this.branch);
  }

  deleteProperty(id: string){
    const promise = this.apiService.deleteProperty(id, "1").toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
    //this.apiService.insertBranch(id, this.branch);
  }

}
