//
//  TimeLineViewController.swift
//  Stolperwege
//
//  Created by Niclas Guenther on 19.11.15.
//  Copyright © 2015 Mkayswork. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

    @IBOutlet var menuButton: UIBarButtonItem!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
		
		self.setUpEvents()
    }
	
	func setUpEvents() {
		let events = ExampleData.persons[0].events
		var counter = 1
		
		for event in events {
			let label = UILabel(frame: CGRect(x: Int(self.view.bounds.width / 4), y: 100 * counter, width: Int(self.view.bounds.width), height: 50))
			label.text =  "\(event.description) " + " \(event.startDate)"
			label.font = label.font.fontWithSize(12)
			self.view.addSubview(label)
			counter += 1
		}
	}
}
