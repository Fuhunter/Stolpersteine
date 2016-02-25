//
//  Stolperstein.swift
//  Stolperwege
//
//  Created by Naffi on 25.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import Foundation
import MapKit


/**
Used for the stones "Stolpersteine", the historical devotments to persons from WW1 + WW2
 
    attributes:
 
    - coordinate: CLLocationCoordinate2D
    - devotment: String
*/
class Stolperstein {
    
    var coordinate: CLLocationCoordinate2D
    var city: String
    
    init(coordinate: CLLocationCoordinate2D, city: String){
        
        self.coordinate = coordinate
        self.city = city
        
    }
    
}