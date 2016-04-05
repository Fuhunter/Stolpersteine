//
//  RelationsViewController.swift
//  Stolperwege
//
//  Created by Niclas Guenther on 05/04/16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

class RelationsViewController: UIViewController {

	@IBOutlet weak var personLabel: UILabel!
	
	var persons: String!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.personLabel.text = persons
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
