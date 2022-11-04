//
//  OrderTrackPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation
import UIKit
import CoreLocation
import MapKit

extension OrderTrackPageViewController {
    private enum Constants {
        static let latitudeDelta: CLLocationDegrees = 0.01
        static let longitudeDelta: CLLocationDegrees = 0.02
    }
}

protocol IOrderTrackPageViewController: IBaseView {
    // TODO: Declare view methods
}

class OrderTrackPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var mapView: MKMapView!

    var presenter: IOrderTrackPagePresenter?

    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationOperations()
    }

    @IBAction private func backToHomePageButton() {
        presenter?.navigateHomePage()
    }
}

extension OrderTrackPageViewController: IOrderTrackPageViewController {

}

extension OrderTrackPageViewController {
    func locationOperations() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension OrderTrackPageViewController: CLLocationManagerDelegate  {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        let getLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let zoom = MKCoordinateSpan(latitudeDelta: Constants.latitudeDelta, longitudeDelta: Constants.longitudeDelta)
        let mapZone = MKCoordinateRegion(center: getLocation, span: zoom)
        mapView.setRegion(mapZone, animated: true)
        mapView.showsUserLocation = true
    }
}
