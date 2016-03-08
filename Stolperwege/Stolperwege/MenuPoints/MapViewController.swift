//
//  MapViewController.swift
//  Stolperwege
//
//  Created by Niclas Guenther on 18/11/15.
//  Copyright © 2015 Mkayswork. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var navigationBar: UINavigationItem!    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
	
	// Get Users Location
	let locationManager: CLLocationManager! = CLLocationManager()
	
	// ExampleData
	let examplePersons = ExampleData.persons
	let exampleLocations = ExampleData.locationsOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Menu
        
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
		
		// SetUp View
		self.mapView.delegate = self
		
		// User Location
		self.locationManager.delegate = self
		self.locationManager.requestWhenInUseAuthorization()
		
		if CLLocationManager.locationServicesEnabled() {
			self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
			self.locationManager.requestLocation()
		}
		
		self.locationManager.distanceFilter = 100.0
		
		self.mapView.showsUserLocation = true

		
		for person in self.examplePersons {
			let coordinate = person.stolperStein.coordinate
			let annotation = MKPointAnnotation()
			annotation.coordinate = coordinate
			annotation.title = "\(person.name) + \(person.familyName)"
			annotation.subtitle = "\(person.birthDate)"
			
			self.mapView.addAnnotation(annotation)
		}
    }
	
	func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
	}
	
	func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
		print("Errors: " + error.localizedDescription)
	}
}
