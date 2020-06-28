//
//  ViewController.swift
//  Where Was I ?
//
//  Created by ahmed kamel on 11/6/1441 AH.
//  Copyright © 1441 AH ahmed kamel. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    
    let annotation = MKPointAnnotation()
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //that mean if you need to perform functions related to the location manager then you should look in this class because it inhertince from it
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        /*let location = CLLocationCoordinate2DMake(30.0788, 31.2038)
        let span = MKCoordinateSpan(latitudeDelta: 0.0002,  longitudeDelta: 0.0002)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "koshari elsalakan"
        annotation.subtitle = "Saleh Tarboun"
        map.addAnnotation(annotation)*/
        
        updateSavedPin()
        
    }
    func updateSavedPin (){
         annotation.title = "i was here"
         annotation.subtitle = "Remember"
         if let coords = DataStore().getLastLocation() {
             annotation.coordinate.latitude = Double(coords.latitude)!
             annotation.coordinate.longitude = Double(coords.longitude)!
             map.addAnnotation(annotation)
         }
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        
        if let lat = coord?.latitude{
            if let long = coord?.longitude{
                DataStore().storeDataPoint(latitude: String(lat), longitude: String(long))
            }
        }
        
        updateSavedPin()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else{
            print("location not enabled")
            return
        }
        print("location allowed")
        
        map.showsUserLocation = true
    }


}

