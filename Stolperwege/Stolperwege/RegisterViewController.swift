//
//  RegisterViewController.swift
//  Stolperwege
//
//  Created by Matthias K. on 25.03.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit
import Alamofire
import IDZSwiftCommonCrypto

class RegisterViewController: UIViewController {

    @IBOutlet var nameInput: UITextField!
    @IBOutlet var userNameInput: UITextField!
    @IBOutlet var passwordInput: UITextField!

    let networker = Networker()
    
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
            
            Networker.registerUser(userName, password: password, fullName: name)
            // Nothing happening yet
        }
    }
        
}
    

