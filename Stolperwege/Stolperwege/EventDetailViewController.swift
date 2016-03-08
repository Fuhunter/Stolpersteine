//
//  EventDescriptionViewController.swift
//  Stolperwege
//
//  Created by Naffi on 26.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet var eventShortDescription: UILabel!
    @IBOutlet var eventStartDate: UILabel!
    @IBOutlet var eventDuration: UILabel!
    @IBOutlet var eventLocation: UILabel!
    @IBOutlet var eventDescription: UITextView!
    
    
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configureData(){
        eventShortDescription.text = String(event.type)
        eventStartDate.text = "Startdatum: \(String(event.startDate))"
        eventDuration.text = "Dauer/Ende: \(String(event.duration))"
        eventLocation.text = "Ort: \(event.location.city)"
        eventDescription.text = event.description
        
        configureDesign()
    }
    
    func configureDesign(){
        eventDescription.layer.borderColor = UIColor.whiteColor().CGColor
        eventDescription.layer.borderWidth = 2
        eventDescription.layer.cornerRadius = 15
    }
}
