//
//  ViewController.swift
//  Stolperwege
//
//  Created by Naffi on 16.11.15.
//  Copyright © 2015 Mkayswork. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
	@IBOutlet weak var tabelView: UITableView!
	
	var persons: JSON = nil
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        Alamofire.request(.GET, testLink, parameters: nil, encoding: .JSON, headers: nil).response { (request, response, data, error) -> Void in
			UIApplication.sharedApplication().networkActivityIndicatorVisible = true
			
            guard let rdata = data else {
                return
            }
			
            let jsonStringOptional = NSString(data: rdata, encoding: NSISO2022JPStringEncoding)
            
            guard let jsonString = jsonStringOptional else {
                return
            }
			
            
            self.persons = JSON.parse(jsonString as String)
			self.tabelView.reloadData()
			
			UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.persons.count
	}
	
	func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return true
	}
	
	func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
		// FIXME
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("personCell")! as UITableViewCell
		
		let item = self.persons[indexPath.row]
		
		cell.textLabel!.text = item["name"].string!
		
		cell.accessoryType = .DisclosureIndicator
		
		return cell
	}
    
}
