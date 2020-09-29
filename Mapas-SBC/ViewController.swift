//
//  ViewController.swift
//  Mapas-SBC
//
//  Created by A.K. on 20/08/20.
//  Copyright © 2020 AK. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            gerenciadorLocal.delegate = self
            gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
            gerenciadorLocal.requestWhenInUseAuthorization()
            gerenciadorLocal.startUpdatingLocation()
            
    //        let latitude: CLLocationDegrees = -23.587033
    //        let longitude: CLLocationDegrees = -46.657677
    //        let deltaLatitude: CLLocationDegrees = 0.01
    //        let deltaLongitude: CLLocationDegrees = 0.01
    //
    //        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    //        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
    //        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaVisualizacao)
    //        mapa.setRegion(regiao, animated: true)
    //
    //        // Anotacao
    //        let anotacao = MKPointAnnotation()
    //        anotacao.coordinate = localizacao
    //        anotacao.title = "Parque do Ibira"
    //        anotacao.subtitle = "Parque bacana para caçar pokemons"
    //        mapa.addAnnotation(anotacao)
            
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let localizacaoUsuario: CLLocation = locations.last!

            // monta exibicao do mapa
            let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
            let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude
            let deltaLatitude: CLLocationDegrees = 0.01
            let deltaLongitude: CLLocationDegrees = 0.01

            let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
            let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaVisualizacao)
            mapa.setRegion(regiao, animated: true)
            
            // Anotacao (Pin)
            let anotacao = MKPointAnnotation()
            anotacao.coordinate = localizacao
            anotacao.title = "Minha localização atual"
            anotacao.subtitle = "Estou aqui!"
            mapa.addAnnotation(anotacao)
        }


}

