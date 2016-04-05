//
//  SideMenuViewController.swift
//  Stolperwege
//
//  Created by Niclas Guenther on 16/11/15.
//  Copyright © 2015 Mkayswork. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {

    //@IBOutlet weak var tableView: UITableView!
    var selectedMenuItem: Int = 0
    
    let menuItems: [String] = ["Karten", "Personen", "Historische Karten", "3D Gebäude", "Zeitlinien", "Einstellungen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
		if identifier == "logout" {
			Networker.logoutUser({ (success) in
				
			})
			
			if NSUserDefaults.standardUserDefaults().stringForKey("userURI") == nil {
				return true
			} else {
				let alert = UIAlertController(title: "Fehler beim Ausloggen", message: "Bitte erneut versuchen", preferredStyle: .Alert)
				alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
				self.parentViewController?.presentViewController(alert, animated: true, completion: nil)
				return false
			}
		}
		
		return true
	}
}

    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch self.selectedMenuItem {
        case 0:
            break  Karten
        case 1:   Personen
            self.performSegueWithIdentifier("PersonSegue", sender: sender)
            break
        case 2:  Historische Karten
            break
        case 3:  3D Gebäude
            break
        case 4:  Zeitlinien
            break
        case 5:  Einstellungen
            break
        default:
            break
        }
    }
}


// MARK - TableViewDatasource
extension SideMenuViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.menuItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.menuItems[indexPath.row]
        
        return cell
    }
}


// MARK - TableViewDelegate
extension SideMenuViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedMenuItem = indexPath.row
    }
}*/
