//
//  MapViewController.swift
//  Stolperwege
//
//  Created by Niclas Guenther on 18/11/15.
//  Copyright © 2015 Mkayswork. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var navigationBar: UINavigationItem!    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
	
	// Get Users Location
	let locationManager: CLLocationManager! = CLLocationManager()
	var userLocation: CLLocationCoordinate2D?
	
	// ExampleData
	let examplePersons = ExampleData.persons
	let exampleLocations = ExampleData.locationsOne
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup Menu
        
        if self.revealViewController() != nil {
            self.menuButton.target = self.revealViewController()
            self.menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
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
		
		self.getUserLocations()
    }
	
	func getUserLocations() -> Void {
		let URL = restAPI + "getlocations"
		
		Alamofire.request(.GET, URL, parameters: ["target": dummyURI], encoding: .URLEncodedInURL, headers: nil).responseJSON { response in
			UIApplication.sharedApplication().networkActivityIndicatorVisible = true
			
			guard let value = response.result.value else {
				return
			}
			
			let jsonResponse = JSON(value)
			
			if !jsonResponse["success"].bool! {
				let alert = UIAlertController(title: "Could not retrieve Locations", message: jsonResponse["message"].string, preferredStyle: .Alert)
				alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
				
				self.presentViewController(alert, animated: true, completion: nil)
				
				UIApplication.sharedApplication().networkActivityIndicatorVisible = false
				return
			}
			
			// FIXME
			for user in jsonResponse["result"].arrayValue {
				let coordinate = CLLocationCoordinate2D(latitude: Double(user["latitude"].stringValue)!, longitude: Double(user["longitude"].stringValue)!)
				let annotation = MKPointAnnotation()
				annotation.coordinate = coordinate
				annotation.title = user["name"].stringValue
				
				let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
				pinAnnotation.pinTintColor = UIColor.purpleColor()
				
				self.mapView.addAnnotation(annotation)
			}
			
			UIApplication.sharedApplication().networkActivityIndicatorVisible = false
		}
	}
	
	func updateUserLocation(latitude latitude: CLLocationDegrees!, longitude: CLLocationDegrees!) -> Void {
		let URL = restAPI + "setlocation"
		
		Alamofire.request(.POST, URL, parameters: ["target": dummyURI, "lat": latitude, "lon": longitude], encoding: .URLEncodedInURL, headers: nil).responseJSON { response in
			UIApplication.sharedApplication().networkActivityIndicatorVisible = true
			
			guard let value = response.result.value else {
				return
			}
			
			let jsonResponse = JSON(value)
			
			
			if jsonResponse["success"].bool! {
				return
			}
			
			UIApplication.sharedApplication().networkActivityIndicatorVisible = false
			
			NSLog("ALERT, NO Locationpdate")
			
			let alert = UIAlertController(title: "Fehler bei Locationupdate", message: jsonResponse["message"].string, preferredStyle: .Alert)
			alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
			
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}
	
	func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		if !locationShare {
			return
		}
		
		self.userLocation = locations[0].coordinate
		
		self.updateUserLocation(latitude: self.userLocation!.latitude, longitude: self.userLocation!.longitude)
	}
	
	func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
		print("Errors: " + error.localizedDescription)
	}
}
