//
//  NearbyCafesViewController.swift
//  coffee_App
//
//  Created by Mohamed AbdElhakam on 14/08/2023.
//

import UIKit
import MapKit
class NearbyCafesViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var cafeObject : CoffeeShop!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.layer.cornerRadius = backBtn.frame.size.width / 2
        backBtn.clipsToBounds = true
        
        let initialLocation = CLLocation(latitude: 30.025422, longitude: 31.015311)
        setStartingLocation(location: initialLocation, distance: 10)
        
        setupComingData()

    }
    
    private func setupComingData(){
        imageView.image = cafeObject.image
        titleLbl.text = cafeObject.title
        rating.text = cafeObject.rating
    }

    
    private func setStartingLocation(location: CLLocation, distance: CLLocationDistance){
        
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapView.setRegion(region, animated: true)
        let regionBoundries = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 30000, longitudinalMeters: 31000)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: regionBoundries), animated: true)
        let zoomRegion = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 500000)
        mapView.setCameraZoomRange(zoomRegion, animated: true)
        
    }
    
    
    @IBAction func viewProductBtn(_ sender: UIButton) {
        let vc = ReserveViewController.instantiat(name: .Reserve)
        vc.name = cafeObject.image
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
