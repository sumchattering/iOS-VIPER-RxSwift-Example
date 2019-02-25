//
//  CoolRestaurantsTests.swift
//  RestaurantRepositoryTests
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import XCTest
import RxSwift

@testable import CoolRestaurants

class RestaurantRepositoryTests: XCTestCase {
    
    var restaurantRepositoy: RestaurantRepository?
    var restaurants: [Restaurant]?
    private let disposeBag = DisposeBag()
    
    override func setUp() {
        restaurantRepositoy = RepositoryInjection.provideRestaurantRepository()
    }
    
    func testRestaurantRepository() {
        let expectation = self.expectation(description: "Restaurants")
        
        restaurantRepositoy?.getRestaurants().subscribe(onSuccess: { [weak self] restaurants in
            self?.restaurants = restaurants
            expectation.fulfill()
            }, onError: { error in
                XCTFail("Error \(error)")
        }).disposed(by: self.disposeBag)
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(restaurants!.count > 0)
    }
    
}
