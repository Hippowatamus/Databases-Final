import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";

@Component({
  selector: 'app-guest-interface',
  templateUrl: './guest-interface.component.html',
  styleUrls: ['./guest-interface.component.css']
})
export class GuestInterfaceComponent implements OnInit {

  constructor(private route: ActivatedRoute) { }

  ngOnInit() {
  }

}
