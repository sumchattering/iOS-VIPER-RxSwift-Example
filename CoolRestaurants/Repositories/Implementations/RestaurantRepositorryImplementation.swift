//
//  RestaurantRepositorryImplementation.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import RxSwift
import MapKit

class RestaurantRepositoryImplementation: RestaurantRepository {
    
    func getRestaurants(region: MKCoordinateRegion) -> Single<[Restaurant]> {
        return Single.just([])
    }

}
