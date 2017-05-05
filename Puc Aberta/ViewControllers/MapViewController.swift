//
//  MapViewController.swift
//  Puc Aberta
//
//  Created by Marcelo Rodrigues dos Santos Junior on 01/05/17.
//  Copyright © 2017 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var nameBuildingTextField: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var viewDetailHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buildingTypeLabel: UILabel!
    @IBOutlet weak var pinTypeImageView: UIImageView!
    
    var buildings: [Building] = []
    var locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self

        loadBuildings()
        
        mapView.addAnnotations(buildings)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDetailHeightConstraint.constant = 0;
        nameBuildingTextField.isHidden = true
        buildingTypeLabel.isHidden = true
        pinTypeImageView.isHidden = true
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    
    func loadBuildings() {
        
        do {
            let path = Bundle.main.path(forResource: "builds", ofType: "csv")
            var text = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
            var buildingsArr = text.components(separatedBy: "\n")
            for building in buildingsArr {
                var buildingSeparated = building.components(separatedBy: ";")
                if buildingSeparated.count < 2 {
                    continue
                }
                buildings.append(Building(id: buildingSeparated[0],
                                           name: buildingSeparated[1],
                                           type: buildingSeparated[6],
                                           latitude: buildingSeparated[4],
                                           longitude: buildingSeparated[5]))
            }
         
            
            
            
        } catch {
            
        }

    }
    
    
}



extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        let identifier = "CustomAnnotation"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = false
            annotationView!.image = UIImage(named: "ic_receptivo_2")!
            
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let annotation = view.annotation as! Building
        nameBuildingTextField.text = annotation.name
        
        if viewDetailHeightConstraint.constant == 0 {
            viewDetailHeightConstraint.constant = 45;
            nameBuildingTextField.isHidden = false
            buildingTypeLabel.isHidden = false
            pinTypeImageView.isHidden = false
            
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
        
    }
    
}

