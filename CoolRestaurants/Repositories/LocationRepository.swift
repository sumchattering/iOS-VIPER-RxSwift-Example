//
//  LocationRepository.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 26/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

protocol LocationRepository {
    
    func requestLocationAuthorization() -> Single<CLAuthorizationStatus>
    
    func getLocationAuthorizationStatus() -> Single<CLAuthorizationStatus>

    func getCurrentLocation() -> Single<CLLocation>
}
