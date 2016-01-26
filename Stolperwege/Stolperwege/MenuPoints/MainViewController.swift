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


class MainViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
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
            guard let rdata = data else {
                return
            }
			
            let jsonStringOptional = NSString(data: rdata, encoding: NSISO2022JPStringEncoding)
            
            guard let jsonString = jsonStringOptional else {
                return
            }
			
            
            let persons = JSON.parse(jsonString as String)
        }
    }
    
}
