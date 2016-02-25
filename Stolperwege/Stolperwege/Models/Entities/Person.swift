//
//  Person.swift
//  Stolperwege
//
//  Created by Naffi on 25.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import Foundation

class Person {
    
    var name: String
    var title: String // title for what? OWL-model is unclear here.
    var familyName: String
    var familyMaidenName: String
    
    var sex: String
    var birthDate: NSDate
    var events: [Event]
    var image: UIImage
    var stolperStein: Stolperstein
    
    init (name: String, title: String, familyName: String, familyMaidenName: String, sex: String, birthDate: NSDate, events: [Event], image: UIImage, stolperStein: Stolperstein){
        
        self.name = name
        self.title = title
        self.familyName = familyName
        self.familyMaidenName = familyMaidenName
        self.sex = sex
        self.birthDate = birthDate
        self.events = events
        self.image = image
        self.stolperStein = stolperStein
    }
    
}