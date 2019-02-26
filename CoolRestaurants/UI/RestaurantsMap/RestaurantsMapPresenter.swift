//
//  RestaurantsMapPresenter.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

class RestaurantsMapPresenter: BasePresenter {

    private let router: RestaurantsMapRouter
    private let restaurantRepository: RestaurantRepository
    private let locationRepository: LocationRepository
    private var restaurantsMapView: RestaurantsMapView? { return view as? RestaurantsMapView }
    private let disposeBag = DisposeBag()
    private var userCurrentLocation: CLLocation?
    
    var restaurantRegion: MKCoordinateRegion?

    init(locationRepository: LocationRepository, restaurantRepository: RestaurantRepository, router: RestaurantsMapRouter) {
        self.locationRepository = locationRepository
		self.restaurantRepository = restaurantRepository
        self.router = router
    }

    override func initialize() {
        super.initialize()
        checkLocationPermission()
    }
    
    override func resume() {
        super.resume()
        checkLocationPermission()
    }
    
    private func checkLocationPermission() {
        self.locationRepository.getLocationAuthorizationStatus().subscribe(onSuccess: { [weak self] status in
            switch status {
            case .notDetermined: self?.requestLocationPermission()
            case .authorizedAlways, .authorizedWhenInUse: self?.onLocationPermissionSuccess()
            case .denied, .restricted: self?.restaurantsMapView?.showLocationNeededAlert()
            }
        }, onError: { [weak self] error in
            self?.restaurantsMapView?.showLocationErrorAlert()
        }).disposed(by: self.disposeBag)
    }
    
    func requestLocationPermission() {
        self.locationRepository.requestLocationAuthorization().subscribe(onSuccess: { [weak self] _ in
            self?.checkLocationPermission()
            }, onError: { [weak self] _ in
                self?.restaurantsMapView?.showLocationErrorAlert()
        }).disposed(by: self.disposeBag)
    }
    
    func onLocationPermissionSuccess() {
        self.locationRepository.getCurrentLocation().subscribe(onSuccess: { [weak self] location in
            self?.userCurrentLocation = location
            self?.restaurantsMapView?.centreMapOnLocation(location: location)
        }, onError: { [weak self] _ in
            self?.restaurantsMapView?.showLocationErrorAlert()
        }).disposed(by: self.disposeBag)
    }

    private func fetchRestaurants(region: MKCoordinateRegion) {
        guard userCurrentLocation != nil else { return }
        
        if let restaurantRegion = self.restaurantRegion, restaurantRegion.contains(region.center) {
            return
        }
        
        self.restaurantRegion = region
        self.restaurantRepository.getRestaurants(region: region).subscribe(onSuccess: { [weak self] restaurants in
            self?.restaurantsMapView?.showRestaurants(restaurants: restaurants)
        }, onError: { _ in
            // handle error
            self.restaurantRegion = nil
        }).disposed(by: self.disposeBag)
    }
}

extension RestaurantsMapPresenter: RestaurantsMapUserActionsListener {
    
    func mapViewDidChangeRegion(region: MKCoordinateRegion) {
        self.fetchRestaurants(region: region)
    }
    
    func userTappedGoToSettings() {
        if !CLLocationManager.locationServicesEnabled() {
            if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION") {
                // If general location settings are disabled then open general location settings
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                // If general location settings are enabled then open location settings for the app
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func userDidSelectRestaurant(restaurant: Restaurant) {
        self.router.goToRestaurantDetail(restaurant: restaurant)
    }
}
