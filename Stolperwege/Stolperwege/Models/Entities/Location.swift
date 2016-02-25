//
//  Adress.swift
//  Stolperwege
//
//  Created by Naffi on 25.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import Foundation
import MapKit
import UIKit

/**
Used for every kind of location, e.g historical locations, locations linked to a person (birthplace, deathplace).
    
    attributes:
 
    - nameOfLocation : String
    - coordinate: CLLocationCoordinate2D
    - streetName: String
    - houseNo: Int
    - postCode: Int
    - city: String
    - images: [UIImage]
*/
enum LocationType{
    case A
    case B
}

class Location {
    
    var name: String
    var coordinate: CLLocationCoordinate2D
    var type: LocationType
    var street: String
    var houseNo: Int
    var postCode: Int
    var city: String
    var images: [UIImage]
    
    init(name: String, coordinate: CLLocationCoordinate2D, street: String?=nil, type: LocationType, houseNo: Int?=nil, postCode: Int?=nil, city: String, images: [UIImage]?=nil){
        
        self.name = name
        self.coordinate = coordinate
        self.type = type
        self.street = street!
        self.houseNo = houseNo!
        self.postCode = postCode!
        self.city = city
        self.images = images!
    }
    
    

}