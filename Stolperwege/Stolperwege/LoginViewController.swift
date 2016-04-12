//
//  LoginViewController.swift
//  Stolperwege
//
//  Created by Matthias K. on 25.03.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet var userNameInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginTapped(sender: AnyObject) {
        let username = userNameInput.text!
        let password = passwordInput.text!
        
        
        Networker.loginUser(username, password: password, completitonHandler: {sucess in
            switch sucess {
            case true: // Change me if API Works...
                
                self.performSegueWithIdentifier("toMenu", sender: self)
            case false:
                let alert = UIAlertController(title: "Loginfehler", message: "Logindaten falsch oder User ist bereits eingeloggt!", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                
            }
        })
    }

}
