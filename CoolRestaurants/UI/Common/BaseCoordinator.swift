//
//  BaseCoordinator.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit

class BaseCoordinator: Coordinator {
    
    weak var parentNavigationController: UINavigationController?
    weak var parentWindow: UIWindow?
    weak var currentNavigationController: UINavigationController?
    
    init(_ navigationController: UINavigationController? = nil, window: UIWindow? = nil) {
        self.parentNavigationController = navigationController
        self.parentWindow = window
    }
    
    func setup() -> UIViewController {
        // Override in subclass
        
        fatalError("This function MUST be overridden in subclasses")
    }
    
    func start() {
        
    }
    
    func close() {
        // Override in subclass
    }
}

