//
//  Example.swift
//  Stolperwege
//
//  Created by Naffi on 25.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import Foundation
import CoreLocation


typealias LocationDataStore = (name: String, coordinate: CLLocationCoordinate2D, type: LocationType, street:String?, houseNo: Int?, postCode: Int?, city: String, images:[UIImage]?)

typealias EventDataStore = (type: EventType, startDate: NSDate, duration: Int, description: String, location: Location, BLA: [String]?)

typealias PersonDataStore = (name : String, title : String?, familyName : String, familyMaidenName : String?, sex : String, birthDate : NSDate, events : [Event], imageName : String, stolperStein:Stolperstein)

class ExampleData {
    
    
    
    class var coordinatesOne : [CLLocationCoordinate2D]
    {
        return [(50.6751067,17.921297600000003), (51.3396955,12.373074699999961), (50.5110021,14.150557700000036)].map({CLLocationCoordinate2DMake($0.0, $0.1)})
    }
    
    class var locationsOne: [Location]{
        let locations : [LocationDataStore] = [("Geburtsort",coordinatesOne[0],LocationType.A, "Teststraße",0,12345,"Opole",nil),
                                                ("Studium",coordinatesOne[1],LocationType.A, "Teststraße",0,12345,"Leipzig",nil),
                                                ("Tod",coordinatesOne[2],LocationType.A, "Teststraße",0,12345,"Theresienstadt",nil)
                                                ]
        return locations.map({Location(name: $0.name, coordinate: $0.coordinate, type: $0.type, street: $0.street, houseNo: $0.houseNo, postCode: $0.postCode, city: $0.city, images: $0.images)})
    }
    
    class var eventsOne: [Event]{
        let events : [EventDataStore] = [(EventType.Birth, NSDate(), 0, "Geburt", locationsOne[0], []),
                                        (EventType.Special, NSDate(), 0, "Hochzeit", locationsOne[1], ["Thersia Münzer"]), // FIXME
                                        (EventType.Special, NSDate(), 0, "Hochzeit", locationsOne[2], [])]
		return events.map({Event(type: $0.type, startDate: $0.startDate, duration: $0.duration, description: $0.description, location: $0.location, relPersons: $0.BLA)})
    }
	
	class var eventsTwo: [Event]{
		let events : [EventDataStore] = [(EventType.Special, NSDate(), 0, "Hochzeit", locationsOne[1], ["Friedrich Münzer"])] // FIXME
		return events.map({Event(type: $0.type, startDate: $0.startDate, duration: $0.duration, description: $0.description, location: $0.location, relPersons: $0.BLA)})
	}
	
	
    class var persons: [Person]
    {
        let dataArray : [PersonDataStore] = [("Friedrich", "Test" , "Münzer", nil, "male", NSDate(), eventsOne, "friedrich.jpg", Stolperstein(coordinate: CLLocationCoordinate2DMake(50.11092209999999, 8.682126700000026), city: "Frankfurt")), ("Theresia", "Blubb", "Münzer", nil, "female", NSDate(), eventsTwo, "friedrich.jpg", Stolperstein(coordinate: CLLocationCoordinate2DMake(50.11092209999999, 8.682126700000030), city: "Frankfurt"))]
        
        return dataArray.map({Person(name: $0.name, title: $0.title, familyName: $0.familyName, familyMaidenName: $0.familyMaidenName, sex: $0.sex, birthDate: $0.birthDate, events: $0.events, image: UIImage(named: $0.imageName)!, stolperStein: $0.stolperStein)})
    }
    
}