import { Injectable } from '@angular/core';
import { Observable } from 'rxjs'
import { HttpClient } from '@angular/common/http'

export interface Property {
  ID: number,
  house_number: number,
  street: string,
  city: string,
  province: string,
  property_type: string,
  room_type: string,
  accomodates: number,
  bathrooms: number,
  beds: number,
  branch_id: number,
  host_id: number,
  renter_rate_id: number
}

@Injectable({
  providedIn: 'root'
})
export class ApiServiceService {

  constructor(private http: HttpClient) {}

  getAllProperty(): Observable<Property[]> {
    console.log(this.http.get<Property[]>('http://localhost:3000/allproperty'))
    return this.http.get<Property[]>('http://localhost:3000/allproperty')
  }

  // getCat(name: string): Observable<Cat> {
  //   return this.http.get<Cat>('http://localhost:8000/api/cats/' + name)
  // }

  // insertCat(cat: Cat): Observable<Cat> {
  //   return this.http.post<Cat>('http://localhost:8000/api/cats/', cat)
  // }

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

