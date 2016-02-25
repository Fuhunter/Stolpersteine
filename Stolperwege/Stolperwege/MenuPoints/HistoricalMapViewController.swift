//
//  HistoricalMapViewController.swift
//  Stolperwege
//
//  Created by Naffi on 19.11.15.
//  Copyright © 2015 Mkayswork. All rights reserved.
//

import Foundation

class HistoricalMapViewController: UIViewController {
    
    @IBOutlet var menuButton: UIBarButtonItem!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}