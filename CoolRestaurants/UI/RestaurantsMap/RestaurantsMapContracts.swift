//
//  RestaurantsMapContracts.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import MapKit

protocol RestaurantsMapView: View {

    func showRestaurants(restaurants: [Restaurant])
    
    func centreMapOnLocation(location: CLLocation)
        
    func showLocationNeededAlert()
    
    func showLocationErrorAlert()
}

protocol RestaurantsMapUserActionsListener: UserActionsListener {
    
    func userDidSelectRestaurant(restaurant: Restaurant)
    
    func userTappedGoToSettings()
    
    func mapViewDidChangeRegion(region: MKCoordinateRegion)
}

protocol RestaurantsMapRouter {

    func goToRestaurantDetail(restaurant: Restaurant)
}
