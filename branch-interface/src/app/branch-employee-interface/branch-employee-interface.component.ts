import { Component, OnInit } from '@angular/core';
import { ApiServiceService } from "../api-service.service";
import { ActivatedRoute } from "@angular/router";

@Component({
  selector: 'app-branch-employee-interface',
  templateUrl: './branch-employee-interface.component.html',
  styleUrls: ['./branch-employee-interface.component.css']
})
export class BranchEmployeeInterfaceComponent implements OnInit {

  constructor(private apiService: ApiServiceService, private route: ActivatedRoute) { }
  data = "Nothing to display";
  ngOnInit() {
    let id: string =this.route.snapshot.paramMap.get('id');
    this.getSpecificData(id);
  }

  getSpecificData(id: string){
    const promise = this.apiService.getBranchEmployeeInfo(id).toPromise();
    promise.then((data)=>{
      console.log(data);
      this.data = JSON.stringify(data);
    }, (error)=>{
      console.log("Promise rejected with " + JSON.stringify(error));
    })
  }
}
