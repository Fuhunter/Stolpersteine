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
import MapKit


private let registerURL = "http://app.stolperwege.hucompute.org/register"
private let loginURL = "http://app.stolperwege.hucompute.org/login"
private let logoutURL = "http://app.stolperwege.hucompute.org/logout"
private let createPersonURL = "http://app.stolperwege.hucompute.org/person"
private let setUserLocationURL = "http://app.stolperwege.hucompute.org/setlocation"
private let getUserLocationsURL = "http://app.stolperwege.hucompute.org/getlocations"
private let getUserDataURL = "http://app.stolperwege.hucompute.org/user" // method: GET
private let deleteUserURL = "http://app.stolperwege.hucompute.org/user" // method: DELETE

class Networker {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    
    class func registerUser(userName: String, password: String, fullName: String) {
        
        
        // Registering users not possible due to missing API from teachers
        
        Alamofire.request(.POST, registerURL , parameters: ["username": "\(userName)", "password": "\(password.MD5)","realname": "\(fullName)"], encoding: .URLEncodedInURL, headers: nil).responseJSON { response in
			
			UIApplication.sharedApplication().networkActivityIndicatorVisible = true
			
            if let JSON = response.result.value {
                print(JSON)
                print(response.result)
            }
			
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
    
    
    class func loginUser(username: String, password: String, completitonHandler: Bool -> ()) {
        
        
        Alamofire.request(.POST, loginURL, parameters: ["username": "\(username)","password": "\(password.MD5)"], encoding: .URLEncodedInURL, headers: nil).responseJSON { response in
			
			UIApplication.sharedApplication().networkActivityIndicatorVisible = true
			
            guard let value = response.result.value else {
				UIApplication.sharedApplication().networkActivityIndicatorVisible = false
				return
			}
			
			let json = JSON(value)
			
			let onlineStatus = json["http://ontologies.hucompute.org/StolperwegeUser#status"].stringValue
			
			if onlineStatus == "online" {
				NSUserDefaults.standardUserDefaults().setObject(json["uri"].stringValue, forKey: "userURI")
				completitonHandler(true)
			} else {
				completitonHandler(false)
			}
			
			UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
	class func logoutUser(completionHandler: (Bool) -> ()) {
		Alamofire.request(.POST, logoutURL, parameters: ["target" : dummyURI], encoding: .URLEncodedInURL, headers: nil).responseJSON { response in
			
			UIApplication.sharedApplication().networkActivityIndicatorVisible = true
			
			guard let value = response.result.value else {
				NSLog("ERROR")
				
				completionHandler(false)
				UIApplication.sharedApplication().networkActivityIndicatorVisible = false
				return
			}

			let json = JSON(value)
			
			let success = json["success"].boolValue
			
			if success {
				NSUserDefaults.standardUserDefaults().removeObjectForKey("userURI")
				completionHandler(true)
			} else {
				completionHandler(false)
				UIApplication.sharedApplication().networkActivityIndicatorVisible = false
			}
		}
    }
    
	class func setUserLocation(coordinate: CLLocationCoordinate2D, completionHandler: Bool -> ()) {
        
        let userURI = NSUserDefaults.standardUserDefaults().objectForKey("userURI")! as! String
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
		
        
        Alamofire.request(.POST, setUserLocationURL, parameters: ["target": userURI,"lat": "\(latitude)","lon": "\(longitude)"], encoding: .URLEncodedInURL, headers: nil).responseJSON { response in
			
			UIApplication.sharedApplication().networkActivityIndicatorVisible = true
			
            guard let value = response.result.value else {
				UIApplication.sharedApplication().networkActivityIndicatorVisible = false
				return
			}
			
			let json = JSON(value)
			
			if !json["success"].boolValue {
				completionHandler(false)
				UIApplication.sharedApplication().networkActivityIndicatorVisible = false
			}
			
			completionHandler(true)
			UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
    
    
}