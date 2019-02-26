//
//  RestaurantsMapViewController.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class ResturantMapViewAnnotaion: MKPointAnnotation {
    let restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        super.init()
    }
}

class RestaurantsMapViewController: BaseViewController {

    @IBOutlet weak var mapViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var mapView: MKMapView!
    
    let annotationIdentifier = "RestaurantsMapViewAnnotation"
    
    private var restaurantsMapUserActionsListener: RestaurantsMapUserActionsListener? {
        return userActionsListener as? RestaurantsMapUserActionsListener
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Theme.theme(self)

        self.setupMapView()
        self.title = Strings.App.Mainview.title
    }

    private func setupMapView() {
        self.mapView.delegate = self
    }
}

extension RestaurantsMapViewController: RestaurantsMapView {
    
    func centreMapOnLocation(location: CLLocation) {
        self.mapView.region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: 10000.0,
            longitudinalMeters: 10000.0
        )
    }
    
    func showLocationNeededAlert() {
        let alert = UIAlertController(title: Strings.App.Mainview.locationPermissionAlertTitle,
                                      message: Strings.App.Mainview.locationPermissionAlertText,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.App.Mainview.locationPermissionAlertSettingsButton,
                                      style: .default,
                                      handler: { [weak self] _ in
            self?.restaurantsMapUserActionsListener?.userTappedGoToSettings()
        }))
        self.present(alert, animated: true)
    }
    
    func showLocationErrorAlert() {
        let alert = UIAlertController(title: Strings.App.Mainview.locationPermissionErrorTitle,
                                      message: Strings.App.Mainview.locationPermissionErrorText,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.App.Mainview.locationPermissionErrorOKButton,
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true)
    }
    
    func showRestaurants(restaurants: [Restaurant]) {
        let annotations = restaurants.map({ restaurant -> MKAnnotation in
            let annotation = ResturantMapViewAnnotaion(restaurant: restaurant)
            annotation.title = restaurant.name
            annotation.coordinate = restaurant.coordinate
            return annotation
        })
        self.mapView.removeAnnotations(self.mapView.annotations)
        self.mapView.addAnnotations(annotations)
    }

}

extension RestaurantsMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is ResturantMapViewAnnotaion else { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        if let annotationView = annotationView {
            annotationView.annotation = annotation
        } else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        
        annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation as? ResturantMapViewAnnotaion else { return }
        self.restaurantsMapUserActionsListener?.userDidSelectRestaurant(restaurant: annotation.restaurant)
    }
    
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        self.restaurantsMapUserActionsListener?.mapViewDidChangeRegion(region: mapView.region)
    }
    
}
