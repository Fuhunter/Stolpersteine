//
//  EventsMapViewController.swift
//  Stolperwege
//
//  Created by Naffi on 08.03.16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit
import MapKit

class EventsMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var eventsMap: MKMapView!
	
	let locationManager: CLLocationManager! = CLLocationManager()
	
	var events: [Event!] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		// SetUp View
		self.eventsMap.delegate = self
		
		// User Location
		self.locationManager.delegate = self
		self.locationManager.requestWhenInUseAuthorization()
		
		if CLLocationManager.locationServicesEnabled() {
			self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
			self.locationManager.requestLocation()
		}
		
		self.locationManager.distanceFilter = 100.0
		
		self.eventsMap.showsUserLocation = true
		
		
		for event in self.events {
			let coordinate = event.location.coordinate
			let annotation = MKPointAnnotation()
			annotation.coordinate = coordinate
			annotation.title = "\(event.description)"
			annotation.subtitle = "\(event.startDate)"
			
			self.eventsMap.addAnnotation(annotation)
		}
    }
	
	func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
	}
	
	func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
		print("Errors: " + error.localizedDescription)
	}
}
