//
//  ViewController.swift
//  Where Was I ?
//
//  Created by ahmed kamel on 11/6/1441 AH.
//  Copyright © 1441 AH ahmed kamel. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self  //that mean if you need to perform functions related to the location manager then you should look in this class because it inhertince from it
        
    }


}

