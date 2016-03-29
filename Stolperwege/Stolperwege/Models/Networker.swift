//
//  Networker.swift
//  Stolperwege
//
//  Created by Matthias K. on 25.03.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import Foundation
import Alamofire
import IDZSwiftCommonCrypto
import SwiftyJSON


private let registerURL = "http://app.stolperwege.hucompute.org/register"
private let loginURL = "http://app.stolperwege.hucompute.org/login"
private let logoutURL = "http://app.stolperwege.hucompute.org/logout"
private let createPersonURL = "http://app.stolperwege.hucompute.org/person"

class Networker {
    
    class func registerUser(userName: String, password: String, fullName: String){
        
        
        // Tester : 3095c3e4f1465133e5e6be134eb2ebe2
        
        Alamofire.request(.POST, registerURL , parameters: ["username": "\(userName)", "password": "\(password.MD5)","realname": "\(fullName)"], encoding: ParameterEncoding.URL, headers: nil).responseJSON { response in
            
            if let JSON = response.result.value {
                print(JSON)
            }
            
        }
    }
    
    class func loginUser(username: String, password: String) -> Bool {
        
        var correct = false
        Alamofire.request(.POST, loginURL, parameters: ["username": "\(username)","password": "\(password.MD5)"], encoding: ParameterEncoding.URL, headers: nil).responseJSON {response in
            
            print(response.result)   // result of response serialization
            
            print(response.result.value)
//            if let value = JSON(response.result.value!) {
//                print(value["http://ontologies.hucompute.org/StolperwegeUser#username"].string)
//                if value["http://ontologies.hucompute.org/StolperwegeUser#username"].string == "\(username)"{ correct = true}
//            }
        }
        return correct
    }
    
}