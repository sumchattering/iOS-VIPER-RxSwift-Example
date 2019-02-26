//
//  Restuarant.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import MapKit

struct Restaurant {
    let identifier: String
    let name: String
    let coordinate: CLLocationCoordinate2D
    let address: String?
    let categoryName: String?
    let caregoryIconURL: URL?
}
