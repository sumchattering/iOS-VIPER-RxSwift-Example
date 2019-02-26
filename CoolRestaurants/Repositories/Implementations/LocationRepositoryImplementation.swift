//
//  LocationRepositoryImplementation.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 26/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import SwiftLocation
import RxSwift
import MapKit

class LocationRepositoryImplementation: LocationRepository {
    
    func getLocationAuthorizationStatus() -> Single<CLAuthorizationStatus> {
        return Single.just(CLLocationManager.authorizationStatus())
    }
    
    func getCurrentLocation() -> Single<CLLocation> {
        return Single.create(subscribe: { observer in
            Locator.currentPosition(accuracy: .city, onSuccess: { location in
                observer(.success(location))
            }, onFail: { error, lastLocation in
                if let location = lastLocation {
                    observer(.success(location))
                } else {
                    observer(.error(error))
                }
            })
            return Disposables.create()
        })
    }
    
}
