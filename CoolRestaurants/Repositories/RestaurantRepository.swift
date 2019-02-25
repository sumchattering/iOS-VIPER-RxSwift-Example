//
//  RestaurantRepository.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import RxSwift

protocol RestaurantRepository {

    func getRestaurants() -> Single<[Restaurant]>

}
