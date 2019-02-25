//
//  BaseContract.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation

protocol View: class {
    var userActionsListener: UserActionsListener? { get set }
}

protocol UserActionsListener: class {

    var view: View? { get set }

    func attach(view: View)
    func initialize()
    func resume()
    func pause()
}
