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
    
    @IBOutlet weak var switchCanteens: UISwitch!
    
    var groupAIsEnable = false
    var groupBIsEnable = false
    var groupCIsEnable = false
    var groupDIsEnable = false
    var groupEIsEnable = false
    var groupFIsEnable = false
    var groupGIsEnable = false
    var groupHIsEnable = false
    var groupIIsEnable = false
    var groupJIsEnable = false
    
    var buildings: [Building] = []
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewDetailHeightConstraint.constant = 0;
        nameBuildingTextField.isHidden = true
        buildingTypeLabel.isHidden = true
        pinTypeImageView.isHidden = true
        loadEnabledGroups()
        loadBuildings()
        mapView.addAnnotations(buildings)
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
        
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func reloadMap() {
        loadBuildings()
        mapView.addAnnotations(buildings)
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
    }
    
    func loadEnabledGroups() {
        let defaults = UserDefaults.standard
        groupAIsEnable = defaults.bool(forKey: "grupo_a")
        groupBIsEnable = defaults.bool(forKey: "grupo_b")
        groupCIsEnable = defaults.bool(forKey: "grupo_c")
        groupDIsEnable = defaults.bool(forKey: "grupo_d")
        groupEIsEnable = defaults.bool(forKey: "grupo_e")
        groupFIsEnable = defaults.bool(forKey: "grupo_f")
        groupGIsEnable = defaults.bool(forKey: "grupo_g")
        groupHIsEnable = defaults.bool(forKey: "grupo_h")
        groupIIsEnable = defaults.bool(forKey: "grupo_i")
        groupJIsEnable = defaults.bool(forKey: "grupo_j")
        
        
    }
    
    func loadBuildings() {
        loadReceptivesAndFairs()
        
        loadCanteens()
        
        if groupAIsEnable {
            loadGroupA()
        }
        
        if groupBIsEnable {
            loadGroupB()
        }
        
        if groupCIsEnable {
            loadGroupC()
        }
        
        if groupDIsEnable {
            loadGroupD()
        }
        
        if groupEIsEnable {
            loadGroupE()
        }
        
        if groupFIsEnable {
            loadGroupF()
        }
        
        if groupGIsEnable {
            loadGroupG()
        }
        
        if groupHIsEnable {
            loadGroupH()
        }
        
        if groupIIsEnable {
            loadGroupI()
        }
        
        if groupJIsEnable {
            loadGroupJ()
        }
        
    }
    
    func loadReceptivesAndFairs() {
        buildings.append(Building(name: "Receptivo", type: BuildingType.receptive, desc: "", latitude: -19.924542,longitude: -43.993056))
        buildings.append(Building(name: "Feira de cursos", type: BuildingType.fair, desc: "",latitude: -19.922306,longitude: -43.993384))
    }
    
    func loadCanteens() {
        buildings.append(Building(name: "Cantina Sinhazinha", type: BuildingType.canteen, desc: "",latitude: -19.923973,longitude: -43.993499))
        buildings.append(Building(name: "Trailer de Lanches", type: BuildingType.canteen, desc: "",latitude: -19.923878,longitude: -43.994025))
        buildings.append(Building(name: "Cantina Divin Gout", type: BuildingType.canteen, desc: "",latitude: -19.923375,longitude: -43.993772))
        buildings.append(Building(name: "Cantina Shuffner", type: BuildingType.canteen, desc: "",latitude: -19.922603,longitude: -43.992991))
        buildings.append(Building(name: "Cantina Sodexo", type: BuildingType.canteen, desc: "",latitude: -19.923024,longitude: -43.991382))
        
    }
    
    func loadGroupA() {
        buildings.append(Building(name: "Teatro João Paulo II", type: BuildingType.auditoriums, desc: "Grupo A - 13h30 às 15h30",latitude: -19.923171,longitude: -43.991035))
        buildings.append(Building(name: "Instituto Politécnico - IPUC", type: BuildingType.institutes, desc: "Grupo A",latitude: -19.923878,longitude: -43.994025))
    }
    
    func loadGroupB() {
        buildings.append(Building(name: "Auditório I", type: BuildingType.auditoriums, desc: "Grupo B - 13h30 às 15h30",latitude: -19.923265,longitude: -43.992904))
        buildings.append(Building(name: "Faculdade Mineira de Direito", type: BuildingType.institutes, desc: "Grupo B",latitude: -19.922958,longitude: -43.992619))
    }
    
    func loadGroupC() {
        buildings.append(Building(name: "Auditório II", type: BuildingType.auditoriums, desc: "Grupo C - 13h30 às 15h30",latitude: -19.922958,longitude: -43.992619))
        buildings.append(Building(name: "Instituto de Ciências Econômicas e Gerenciais - ICEG", type: BuildingType.institutes, desc: "Grupo C",latitude: -19.922651,longitude: -43.991751))
    }
    
    func loadGroupD() {
        buildings.append(Building(name: "Auditório III", type: BuildingType.auditoriums, desc: "Grupo D - 13h30 às 15h30",latitude: -19.923527,longitude: -43.99335))
        buildings.append(Building(name: "Instituto de Ciências Biológicas e da Saúde - ICBS", type: BuildingType.institutes, desc: "Grupo D",latitude: -19.924401,longitude: -43.994458))
    }
    
    func loadGroupE() {
        buildings.append(Building(name: "Auditório Multiuso", type: BuildingType.auditoriums, desc: "Grupo E - 13h30 às 15h30",latitude: -19.923527,longitude: -43.993354))
        buildings.append(Building(name: "Instituto de Ciências Humanas - ICH", type: BuildingType.institutes, desc: "Grupo E",latitude: -19.92308,longitude: -43.992009))
    }
    
    func loadGroupF() {
        buildings.append(Building(name: "Teatro João Paulo II", type: BuildingType.auditoriums, desc: "Grupo F - 16h às 18h",latitude: -19.923171,longitude: -43.991035))
        buildings.append(Building(name: "Instituto de Ciências Biológicas e da Saúde - ICBS", type: BuildingType.institutes, desc: "Grupo F",latitude: -19.924401,longitude: -43.994458))
    }
    
    func loadGroupG() {
        buildings.append(Building(name: "Auditório I", type: BuildingType.auditoriums, desc: "Grupo G - 16h às 18h",latitude: -19.923265,longitude: -43.992904))
        buildings.append(Building(name: "Faculdade de Psicologia", type: BuildingType.institutes, desc: "Grupo G",latitude: -19.922958,longitude: -43.992619))
    }
    
    func loadGroupH() {
        buildings.append(Building(name: "Auditório II", type: BuildingType.auditoriums, desc: "Grupo H - 16h às 18h",latitude: -19.922958,longitude: -43.992619))
        buildings.append(Building(name: "Faculdade de Comunicação e Artes", type: BuildingType.institutes, desc: "Grupo H",latitude: -19.922651,longitude: -43.991751))
    }
    
    func loadGroupI() {
        buildings.append(Building(name: "Auditório III", type: BuildingType.auditoriums, desc: "Grupo I - 16h às 18h",latitude: -19.923527,longitude: -43.99335))
        buildings.append(Building(name: "Instituto de Ciências Sociais - ICS", type: BuildingType.institutes, desc: "Grupo I",latitude: -19.924401,longitude: -43.994458))
    }
    
    func loadGroupJ() {
        buildings.append(Building(name: "Auditório Multiuso", type: BuildingType.auditoriums, desc: "Grupo J - 16h às 18h",latitude: -19.923527,longitude: -43.993354))
        buildings.append(Building(name: "nstituto de Ciências Exatas e Informática - ICEI", type: BuildingType.institutes, desc: "Grupo J",latitude: -19.92308,longitude: -43.992009))
    }
    
    func changeCanteensState() {
        for annotations in mapView.annotations {
            let building = mapView.view(for: annotations)?.image
            if building == #imageLiteral(resourceName: "ic_cantinas") {
                mapView.view(for: annotations)?.isHidden = !switchCanteens.isOn
            }
        }
    }
    
    
    @IBAction func changedCanteensState(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(switchCanteens.isOn, forKey: "showCanteen")
        changeCanteensState()
    }
    
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        let building = annotation as! Building
        
        let identifier = "CustomAnnotation"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = false
            if building.type == .canteen {
                annotationView!.image = #imageLiteral(resourceName: "ic_cantinas")
                
                let defaults = UserDefaults.standard
                let switchCanteen = defaults.bool(forKey: "showCanteen")
                
                
                if switchCanteen == false || switchCanteens == nil {
                    annotationView!.isHidden = true
                    switchCanteens.isOn = false
                } else {
                    switchCanteens.isOn = true
                }
            } else if building.type == .receptive {
                annotationView!.image = #imageLiteral(resourceName: "ic_receptivo")
            } else if building.type == .fair {
                annotationView!.image = #imageLiteral(resourceName: "ic_feira_de_cursos")
            } else if building.type == .auditoriums {
                annotationView!.image = #imageLiteral(resourceName: "ic_auditorios")
            } else if building.type == .institutes {
                annotationView!.image = #imageLiteral(resourceName: "ic_institutos_e_faculdades")
            }
            
            
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        let annotation = view.annotation as! Building
        nameBuildingTextField.text = annotation.name
        buildingTypeLabel.text = annotation.desc
        
        
        if annotation.type == .canteen {
            pinTypeImageView.image = #imageLiteral(resourceName: "ic_cantinas")
        } else if annotation.type == .receptive {
            pinTypeImageView.image = #imageLiteral(resourceName: "ic_receptivo")
        } else if annotation.type == .fair {
            pinTypeImageView.image = #imageLiteral(resourceName: "ic_feira_de_cursos")
        } else if annotation.type == .auditoriums {
            pinTypeImageView.image = #imageLiteral(resourceName: "ic_auditorios")
        } else if annotation.type == .institutes {
            pinTypeImageView.image = #imageLiteral(resourceName: "ic_institutos_e_faculdades")
        }
        
        
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

