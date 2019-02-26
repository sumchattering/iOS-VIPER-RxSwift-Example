//
//  RestaurantRepository.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

protocol RestaurantRepository {

    func getRestaurants(region: MKCoordinateRegion) -> Single<[Restaurant]>

}
