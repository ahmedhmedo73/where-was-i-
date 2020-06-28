//
//  Data Store.swift
//  Where Was I ?
//
//  Created by ahmed kamel on 11/7/1441 AH.
//  Copyright © 1441 AH ahmed kamel. All rights reserved.
//

import Foundation

struct StoreKeys {
    static let storedlat  = "storedlat"
    static let storedlong = "storedlong"
}

class DataStore {
    
    func storeDataPoint (latitude: String, longitude: String ){
        let def = UserDefaults.standard
        
        def.set(latitude, forKey: StoreKeys.storedlat)
        def.set(longitude, forKey: StoreKeys.storedlong)
        
        print (latitude + ":" + longitude)
    }
    
    func getLastLocation () -> visitedPoint? {
        let def = UserDefaults.standard
        if let lat = def.string(forKey: StoreKeys.storedlat){
            if let long = def.string(forKey: StoreKeys.storedlong){
                return   visitedPoint(lat: lat, long: long)
            }
        }
        
        return nil
    }
    
}





