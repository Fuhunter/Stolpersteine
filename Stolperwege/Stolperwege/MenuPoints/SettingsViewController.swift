//
//  SettingsViewController.swift
//  Stolperwege
//
//  Created by Naffi on 19.11.15.
//  Copyright © 2015 Mkayswork. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class SettingsViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var menuButton: UIBarButtonItem!
	@IBOutlet weak var locationShareSwitch: UISwitch!
	@IBOutlet weak var setLocationButton: UIButton!
    
    let locationManager = CLLocationManager()
    var userLocation: CLLocationCoordinate2D? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            
        }
        
		
		if (locationShare != nil) && locationShare {
			self.locationShareSwitch.setOn(true, animated: true)
			guard let userLocation = self.userLocation else {
				return
			}
			
			Networker.setUserLocation(userLocation)
			self.setLocationButton.enabled = true
		} else {
			self.locationShareSwitch.setOn(false, animated: true)
			self.setLocationButton.enabled = false
		}
    }
	@IBAction func locationSwitch(sender: UISwitch) {
		locationShare = !locationShare
		self.setLocationButton.enabled = locationShare
	}
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.userLocation = locations[0].coordinate
    }
    
    // Before tapping the button, turn the switch on, otherwise the userLocation will be nil -> App crashes!
    @IBAction func setUserLocation(sender: AnyObject) {
		guard let location = self.userLocation else {
			return
		}
		
        Networker.setUserLocation(location)
    }
    
    
}