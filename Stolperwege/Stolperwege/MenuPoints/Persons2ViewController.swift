//
//  Persons2ViewController.swift
//  Stolperwege
//
//  Created by Naffi on 25.02.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

class Persons2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var menuButton: UIBarButtonItem!
    
    let persons = ExampleData.persons
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonsTableViewCell
        
        let person = persons[indexPath.row]
        
        cell.personImage.image = person.image
        cell.personName.text = "\(person.name) \(person.familyName)"
        cell.personStolperSteinLocation.text = person.stolperStein.city
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toProfile", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? ProfileViewController {
            controller.person = persons[tableView.indexPathForSelectedRow!.row]
        }
    }
    

}
