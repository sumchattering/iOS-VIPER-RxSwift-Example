//
//  RestaurantRepositorryImplementation.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import RxSwift
import MapKit
import FoursquareKit

class RestaurantRepositoryImplementation: RestaurantRepository {
    
    static let clientID = "FLALIBHNU5WHSPJGH2BFVV4S33NGNCSNEFPF25VUVIBX5V3B"
    static let clientSecret = "LKVT1E24TXESO1ME2LSRIY30BDTZ5LTSKP1AUXG0PTSKA2SF"
    let client = FoursquareClient(authentification: Authentification(clientId: clientID, clientSecret: clientSecret))
    let foursquareEndpoint = "venues/search"
    let defaultCategoryIcon = "http://strategicrevolution.com/wp-content/uploads/2015/03/foursquare-Logo-800x800.png"
    
    func getRestaurants(region: MKCoordinateRegion) -> Single<[Restaurant]> {
        return Single.create(subscribe: { [weak self] observer in
            guard let `self` = self else { return Disposables.create() }
            
            let limit = 20
            let radius = RestaurantRepositoryImplementation.getRadiusInMetersForRegion(region: region)
            let parameters = [ "ll": "\(region.center.latitude),\(region.center.longitude)", "limit": "\(limit)", "radius": "\(radius)" ]
            self.client.search.venues(parameters: parameters).response { result in
                switch result {
                case .success(let data):
                    let venues = data.response.venues as [Venue]
                    let restaurants = venues.map({ venue -> Restaurant in
                        let identifier = venue.id
                        let name = venue.name
                        let coordinates = CLLocationCoordinate2D(latitude: venue.location.latitude, longitude: venue.location.longitude)
                        let address = venue.location.formattedAddress?.joined(separator: " ")
                        let category = venue.categories?.first?.name
                        let categoryIconURL = URL(string: venue.categories?.first?.icon.categoryIconUrl ?? self.defaultCategoryIcon)
                        let restaurant = Restaurant(identifier: identifier, name: name, coordinate: coordinates, address: address, categoryName: category, caregoryIconURL: categoryIconURL)
                        return restaurant
                    })
                    observer(.success(restaurants))
                case .failure(let error):
                    observer(.error(error as! Error))
                }
            }
            
            return Disposables.create()
        })
    }
    
    private static func getRadiusInMetersForRegion(region: MKCoordinateRegion) -> Int {
        let span = region.span
        let center = region.center
        
        let loc1 = CLLocation(latitude: center.latitude - span.latitudeDelta * 0.5, longitude: center.longitude)
        let loc2 = CLLocation(latitude: center.latitude + span.latitudeDelta * 0.5, longitude: center.longitude)
        let loc3 = CLLocation(latitude: center.latitude, longitude: center.longitude - span.longitudeDelta * 0.5)
        let loc4 = CLLocation(latitude: center.latitude, longitude: center.longitude + span.longitudeDelta * 0.5)
        
        let metersInLatitude = loc1.distance(from: loc2)
        let metersInLongitude = loc3.distance(from: loc4)
        return Int(min(metersInLatitude, metersInLongitude))
    }

}
