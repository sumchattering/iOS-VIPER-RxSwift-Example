//
//  BasePresenter.swift
//  Matchie
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation


class BasePresenter: UserActionsListener {
    
    weak var view: View?
    
    func attach(view: View) {
        self.view = view
    }
    
    func initialize() {
        // To be implemented in subclass
        trackPresenter()
        debugPrint("Initializing \(self) Address: \(unsafeBitCast(self, to: Int.self))")
    }
    
    func resume() {
        // To be implemented in subclass
        trackPresenter()
        debugPrint("Resuming \(self) Address: \(unsafeBitCast(self, to: Int.self))")
    }
    
    func pause() {
        // To be implemented in subclass
    }
    
    func trackPresenter() {
        // To be implemented
    }
}
