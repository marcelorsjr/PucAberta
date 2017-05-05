//
//  Buildings.swift
//  Puc Aberta
//
//  Created by Marcelo Rodrigues dos Santos Junior on 04/05/17.
//  Copyright © 2017 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import MapKit

class Building: NSObject, MKAnnotation {
    
    var id: String?
    var name: String?
    var type: Int?
    let coordinate: CLLocationCoordinate2D
    
    
    init(id: String, name: String, type: String, latitude: String, longitude: String) {
        
        self.id = id
        self.name = name
        self.type =  Int(type)
        coordinate = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
        
        super.init()
    }

    
    
}
