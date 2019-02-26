//
//  RestaurantsMapContracts.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

protocol RestaurantsMapView: View {

    func showRestaurants(restaurants: [Restaurant])
}

protocol RestaurantsMapUserActionsListener: UserActionsListener {
    
    func userDidSelectRestaurant(restaurant: Restaurant)
}

protocol RestaurantsMapRouter {

    func goToRestaurantDetail(restaurant: Restaurant)
}
