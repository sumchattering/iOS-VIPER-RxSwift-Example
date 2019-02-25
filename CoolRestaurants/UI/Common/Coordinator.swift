//
//  Coordinator.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import UIKit

protocol Coordinator {

    var parentNavigationController: UINavigationController? { get }
    var parentWindow: UIWindow? { get }
    func bind<P: UserActionsListener, V: View>(_ presenter: P, with view: V)
    func setup() -> UIViewController
}

extension Coordinator {

    func bind<P: UserActionsListener, V: View>(_ presenter: P, with view: V) {
        presenter.attach(view: view)
        view.userActionsListener = presenter
    }
}
