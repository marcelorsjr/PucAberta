//
//  Buildings.swift
//  Puc Aberta
//
//  Created by Marcelo Rodrigues dos Santos Junior on 04/05/17.
//  Copyright © 2017 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import MapKit

enum BuildingType {
    case canteen
    case receptive
    case fair
    case auditoriums
    case institutes
}

class Building: NSObject, MKAnnotation {
    
    var name: String?
    var type: BuildingType?
    var desc: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(name: String, type: BuildingType, desc: String, latitude: Double, longitude: Double) {
    
        self.name = name
        self.type =  type
        self.desc = desc
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        super.init()
    }

    
    
}
