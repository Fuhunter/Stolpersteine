//
//  Event.swift
//  Stolperwege
//
//  Created by Naffi on 25.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import Foundation

enum EventType {
    // types of events needed
    case Death
    case Birth
    case Deportation
    case Education
    case Special
}

class Event {
    
    var type: EventType
    var startDate: NSDate
    var duration: Int // OWL model is not clear, Int for now
    var description: String
    var location: Location
    
    init (type: EventType,startDate: NSDate, duration: Int, description: String, location: Location){
        
        self.type = type
        self.startDate = startDate
        self.duration = duration
        self.description = description
        self.location = location
    }
}