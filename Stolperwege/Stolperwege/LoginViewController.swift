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
        
        print(Networker.loginUser(username, password: password))
//        if Networker.loginUser(username, password: password){
//            performSegueWithIdentifier("toMenu", sender: self)
//        } else {
//            let alert = UIAlertController(title: "Falscher Login", message: "Nutzername oder Passwort falsch", preferredStyle: .Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
        

        
    }

}
