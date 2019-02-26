//
//  MockLocationRepositoryImplementation.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 26/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

class MockLocationRepositoryImplementation: LocationRepository {

    static let instance = MockLocationRepositoryImplementation()

    // Amsterdam
    let mockBaseLatitude = 52.370216
    let mockBaseLongitude = 4.895168
    
    func requestLocationAuthorization() -> Single<CLAuthorizationStatus> {
        return Single.just(.authorizedWhenInUse)
    }
    
    func getLocationAuthorizationStatus() -> Single<CLAuthorizationStatus> {
        return Single.just(.authorizedWhenInUse)
    }
    
    func getCurrentLocation() -> Single<CLLocation> {
        let location = CLLocation(latitude: mockBaseLatitude, longitude: mockBaseLongitude)
        return Single.just(location)
    }

}
