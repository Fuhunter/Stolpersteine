//
//  RegisterViewController.swift
//  Stolperwege
//
//  Created by Matthias K. on 25.03.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    @IBOutlet var nameInput: UITextField!
    @IBOutlet var userNameInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    
    let registerURL = "http://app.stolperwege.hucompute.org/register"
    let loginURL = "http://app.stolperwege.hucompute.org/login"
    let logoutURL = "http://app.stolperwege.hucompute.org/logout"
    let createPersonURL = "http://app.stolperwege.hucompute.org/person"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configureView(){
        
    }

    @IBAction func registerTapped(sender: AnyObject) {
        
        if nameInput.text == "" || userNameInput.text == "" || passwordInput.text == ""{
            let alert = UIAlertController(title: "Falsche Eingaben", message: "Eines der Felder ist leer", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            let name = nameInput.text!
            let userName = userNameInput.text!
            let password = passwordInput.text!

            Alamofire.request(.POST, registerURL , parameters: ["username": "maxmustermann", "realname": "Max Mustermann", "password": "12345678"], encoding: .JSON, headers: nil).responseJSON { response in
            
                print(response.request!)
                print(response.response!)
                print(response.data!)
                print(response.result)
                if let JSON = response.result.value {
                    print(JSON)
                }
            }

        }
    }
        
}
    

