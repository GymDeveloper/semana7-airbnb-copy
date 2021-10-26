//
//  TripsViewController.swift
//  semana7
//
//  Created by Linder Hassinger on 26/10/21.
//

import UIKit
import MapKit
import CoreLocation

class TripsViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    let placeViewModel = PlaceViewModel()
    
    //    Tengo que crear las variables para corelocation y userLocation
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocation()
        configure()
        bind()
        configureStyleView()
    }
    
    func requestLocation() {
        //        verificar si el servicio de ubicacion esta disponible
        guard CLLocationManager.locationServicesEnabled() else { return }
        
        //        Solicitar los permisos respectivos
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        
        //        Map delegate
        mapView.delegate = self
    }
    
    func configure() {
        // añadiendo gesto al map
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(getPointFromMap(longGesture: )))
        mapView.addGestureRecognizer(longGesture)
        placeViewModel.getPlaces()
    }
    
    func bind() {
        placeViewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.createAnnotation()
            }
        }
    }
    
    func configureStyleView() {
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.isHidden = true
    }
    
    //    Al dar click largo en el mapa este me brinde la ubicacion
    @objc func getPointFromMap(longGesture: UIGestureRecognizer) {
        let touchPoint = longGesture.location(in: mapView)
        let coordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        
        setAnnotation(coodinates: coordinates, title: "Get Point", subtitle: "\(coordinates.latitude) - \(coordinates.longitude)")
    }
    
    
}

extension TripsViewController: CLLocationManagerDelegate {
    
    //    Una vez que ya tenga el permiso puedo acceder a la latitude y longitude
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //        Obtener la ultima ubicacion que detecto el dispotivo
        guard let bestLocation = locations.last else { return }
        
        print(bestLocation.coordinate.latitude)
        print(bestLocation.coordinate.longitude)
        //        crea una variable que contengo mis coordenadas
        let localValue: CLLocationCoordinate2D = manager.location!.coordinate
        //        creo una variable para definir la distacia de mi ubicacion al mapa en eje Y
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        //        creo una variable para la region
        let region = MKCoordinateRegion(center: localValue, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    //    CREAR PUNTO EN EL MAPA
    func createAnnotation() {
        let places = placeViewModel.arrayResults
        
        for place in places {
            let coordinates = CLLocationCoordinate2D(latitude: Double(place.latitude)!, longitude:  Double(place.longitude)!)
            setAnnotation(coodinates: coordinates, title: place.name, subtitle: "\(place.rating)")
        }
    }
    
    func setAnnotation(coodinates: CLLocationCoordinate2D, title: String, subtitle: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coodinates
        annotation.title = title
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)
    }
    
}

extension TripsViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //    Esta funcion me va dar la información del punto del mapa
        self.contentView.isHidden = false
        self.lblName.text = (view.annotation?.title)!
        self.lblRating.text = (view.annotation?.subtitle)!
    }
    
}
