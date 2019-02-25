//
//  RestaurantsDetailCoordinator.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit

class RestaurantsDetailCoordinator: BaseCoordinator {

    override func setup() -> UIViewController {
        let viewController = RestaurantsDetailViewController()
        let presenter = RestaurantsDetailPresenter(router: self)
        bind(presenter, with: viewController)
        
        return viewController
    }
    
    /*
    
    override func start() {
        let viewController = setup()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func stop() {
        <#navigationController?.popViewController(animated: true)#>
    }
 
    */
}

extension RestaurantsDetailCoordinator: RestaurantsDetailRouter { }
