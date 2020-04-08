import { Injectable } from '@angular/core';
import { Observable } from 'rxjs'
import { HttpClient } from '@angular/common/http'

export interface BranchEmployeeInfo {
  ID: number,
  house_number: number,
  street: string,
  city: string,
  province: string,
  property_type: string,
  room_type: string,
  accomodates: number,
  bathrooms: number,
  bedrooms: number,
  beds: number,
  host_id: number,
  price: string,
  signing_date: string,
  start_date: string,
  end_date: string,
}

export interface AllGuestInfo{

}

export interface GuestBookingInfo {

}

export interface HostPropertyInfo {

}

export interface Property {
  host_id: number
}

export interface Branch {
  branch_country: string
}

@Injectable({
  providedIn: 'root'
})
export class ApiServiceService {

  constructor(private http: HttpClient) {}

  getAllBranchEmployeeInfo(): Observable<BranchEmployeeInfo[]> {
    //console.log(this.http.get<BranchEmployeeInfo[]>('http://localhost:3000/branchemployee'))
    return this.http.get<BranchEmployeeInfo[]>('http://localhost:3000/branchemployee')
  }

  getBranchEmployeeInfo(branch_id: string): Observable<BranchEmployeeInfo> {
    return this.http.get<BranchEmployeeInfo>('http://localhost:3000/branchemployee/' + branch_id)
  }

  getAllGuestInfo(): Observable<AllGuestInfo[]> {
    console.log(this.http.get<AllGuestInfo[]>('http://localhost:3000/guest'))
    return this.http.get<AllGuestInfo[]>('http://localhost:3000/guest')
  }

  getGuestBookingInfo(guest_id: string): Observable<GuestBookingInfo[]> {
    return this.http.get<GuestBookingInfo[]>('http://localhost:3000/guest/'+guest_id)
  }

  getAllHostInfo(host_id: string): Observable<HostPropertyInfo[]> {
    return this.http.get<HostPropertyInfo[]>('http://localhost:3000/host/'+host_id)
  }

  insertProperty(property: Property): Observable<Property> {
     return this.http.post<Property>('http://localhost:3000/host/'+property.host_id, property)
  }

  insertBranch(host_id: string, branch_country: Branch): Observable<Branch> {
    console.log("about to post from api service" +branch_country.branch_country);
    console.log("Host id is"+host_id)
    console.log("url is "+"http://localhost:3000/host/"+host_id)
    return this.http.post<Branch>('http://localhost:3000/host/'+host_id, branch_country)
 }

 deleteProperty(host_id:string, property_id:string): Observable<Property> {
  console.log("test")
  return this.http.delete<Property>('http://localhost:3000/host/'+host_id+'/'+property_id)
}

  // updateCat(cat: Cat): Observable<void> {
  //   return this.http.put<void>(
  //     'http://localhost:8000/api/cats/' + cat.name,
  //     cat
  //   )
  // }

  // deleteCat(name: string) {
  //   return this.http.delete('http://localhost:8000/api/cats/' + name)
  // }
}

