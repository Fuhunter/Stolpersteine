//
//  SettingsViewController.swift
//  Stolperwege
//
//  Created by Naffi on 19.11.15.
//  Copyright © 2015 Mkayswork. All rights reserved.
//

import Foundation

class SettingsViewController: UIViewController {
    
    @IBOutlet var menuButton: UIBarButtonItem!
	@IBOutlet weak var locationShareSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
		
		if (locationShare != nil) && locationShare {
			locationShareSwitch.setOn(true, animated: true)
		} else {
			locationShareSwitch.setOn(false, animated: true)
		}
    }
	@IBAction func locationSwitch(sender: UISwitch) {
		locationShare = !locationShare
	}
}