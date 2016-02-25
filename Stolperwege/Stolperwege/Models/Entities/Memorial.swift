//
//  Memorial.swift
//  Stolperwege
//
//  Created by Naffi on 25.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import Foundation

enum MemorialType {
    // typed of memorials needed     
    case A
    case B
}
class Memorial {
    
    var name: String
    var type: MemorialType
    var location: Location
    
    init(name: String, type: MemorialType, location: Location){
    
        self.name = name
        self.type = type
        self.location = location
    }
    
}

