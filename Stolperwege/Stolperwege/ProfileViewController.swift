//
//  ProfileViewController.swift
//  Stolperwege
//
//  Created by Naffi on 26.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var showMapButton: UIButton!
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ereignisLabel: UILabel!
    @IBOutlet var personName: UILabel!
    @IBOutlet var personDevotmentCity: UILabel!
    @IBOutlet var personImage: UIImageView!
    
    // delegation

    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
    }

    func configureData(){
        personName.text = "\(person.name) \(person.familyName)"
        personDevotmentCity.text = person.stolperStein.city
        personImage.image = person.image
        
        showMapButton.layer.borderColor = UIColor.whiteColor().CGColor
        showMapButton.layer.borderWidth = 2
        showMapButton.layer.cornerRadius = 15
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
            
            cell.eventShortDescription.text = event.type.description
            cell.eventIcon.image = Event.eventImage(event.type)
            cell.eventLocation.text = event.location.city
            cell.eventDate.text = event.startDate.description

			if event.relPersons != nil {
				cell.relationsButton.hidden = false
			} else {
				cell.relationsButton.hidden = true
			}
			
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toEventDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? EventDetailViewController {
            controller.event = person.events[tableView.indexPathForSelectedRow!.row]
        }
		
		if let controller = segue.destinationViewController as? EventsMapViewController {
			controller.events = person.events
		}
    }

}
