//
//  mapViewController.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 11/08/2023.
//

import UIKit
import MapKit
class mapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initLOcation = CLLocation(latitude: 30.025422, longitude: 31.015311)
        
        setupLOcationSetting(location: initLOcation, distance: 1000)
        
    }
    

    func setupLOcationSetting(location : CLLocation , distance : CLLocationDistance){
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        
        mapView.setRegion(region, animated: true)
        
        let regionBoundary = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 30000, longitudinalMeters: 30000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: regionBoundary), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 500000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
}
