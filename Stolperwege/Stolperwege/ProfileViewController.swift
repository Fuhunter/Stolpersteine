//
//  ProfileViewController.swift
//  Stolperwege
//
//  Created by Naffi on 26.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var ereignisLabel: UILabel!
    @IBOutlet var personName: UILabel!
    @IBOutlet var personDevotmentCity: UILabel!
    @IBOutlet var personImage: UIImageView!
    
    
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        
    }

    
    func configureData(){
        personName.text = "\(person.name) \(person.familyName)"
        personDevotmentCity.text = person.stolperStein.city
        personImage.image = person.image
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        if person.events.count == 0 {
            ereignisLabel.text = "Noch keine Ereignisse vorhanden!"
            return UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EventsTableViewCell
            
            let event = person.events[indexPath.row]
            
            cell.eventType.text = event.type.description
            cell.eventIcon.image = Event.eventImage(event.type)
            cell.eventLocation.text = event.location.city
            cell.eventDate.text = event.startDate.description
            
            print(cell.eventType.text = event.type.description)
            
            
            return cell
        }
        
        
        
        //let dateFormatter = NSDateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        
    }
    
    
    
    
}
