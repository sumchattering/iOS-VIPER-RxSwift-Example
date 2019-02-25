//
//  RestaurantsRepositoryImplementation.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import RxSwift

class MockRestaurantsRepositoryImplementation: RestaurantsRepository {
    
    let mockDelay = 2 // seconds
    
    func getRestaurants() -> Single<[Restaurant]> {
        return Single.create(subscribe: { [weak self] observer in
            guard let `self` = self else { return Disposables.create() }
            DispatchQueue.global(qos: .background).async {
                let restaurants = self.createMockRestaurants()
                let futureTime: DispatchTime = .now() + .seconds(Int(self.mockDelay))
                DispatchQueue.main.asyncAfter(deadline: futureTime) {
                    observer(.success(restaurants))
                }
            }
            return Disposables.create()
        })
    }
    
    private func createMockRestaurants() -> [Restaurant] {
        var mockRestaurants = [Restaurant]()
        for index in 0...10 {
            let mockRestaurant = Restaurant(identifier: "MockIdentifier\(index)",
                name: "MockName\(index)",
                description: "MockDescription\(index)")
            mockRestaurants.append(mockRestaurant)
        }
        return mockRestaurants
    }
    
}

