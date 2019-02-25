//
//  Bundle+Extensions.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 30/01/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation

extension Bundle {
    
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
