//
//  RestaurantRepositoryImplementation.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import RxSwift
import MapKit

class MockRestaurantRepositoryImplementation: RestaurantRepository {

    static let instance = MockRestaurantRepositoryImplementation()
    let mockDelay = 2 // seconds

    func getRestaurants(region: MKCoordinateRegion) -> Single<[Restaurant]> {
        return Single.create(subscribe: { [weak self] observer in
            guard let `self` = self else { return Disposables.create() }
            DispatchQueue.global(qos: .background).async {
                let restaurants = self.createMockRestaurants(region: region)
                let futureTime: DispatchTime = .now() + .seconds(Int(self.mockDelay))
                DispatchQueue.main.asyncAfter(deadline: futureTime) {
                    observer(.success(restaurants))
                }
            }
            return Disposables.create()
        })
    }

    private func createMockRestaurants(region: MKCoordinateRegion) -> [Restaurant] {
        var mockRestaurants = [Restaurant]()
        for index in 0...10 {
            let mockRestaurant = Restaurant(identifier: "MockIdentifier\(index)",
                name: "MockRestaurant\(index)",
                coordinate: MockRestaurantRepositoryImplementation.randomCoordinate(center: region.center),
                address: "MockAddress",
                categoryName: "MockCategory",
                caregoryIconURL: URL(string: "https://en.wikipedia.org/wiki/Bar#/media/File:Bar-P1030319.jpg"))
            mockRestaurants.append(mockRestaurant)
        }
        return mockRestaurants
    }
    
    private static func randomCoordinate(center: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let randomLat = center.latitude + randomCoordinate()
        let randomLong = center.longitude + randomCoordinate()
        return CLLocationCoordinate2D(latitude: randomLat, longitude: randomLong)
    }
    
    private static func randomCoordinate() -> Double {
        return Double(arc4random_uniform(140)) * 0.0005
    }

}
