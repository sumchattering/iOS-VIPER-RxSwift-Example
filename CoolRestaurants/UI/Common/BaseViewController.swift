//
//  BaseViewController.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    var userActionsListener: UserActionsListener?

    // MARK: - KeyboardObservers
    var keyboardWillShowObserver: AnyObject?
    var keyboardWillHideObserver: AnyObject?
    var defaultBottomSpace: CGFloat = 0.0
    weak var keyboardConstraint: NSLayoutConstraint?
    
    let notificationCenter = NotificationCenter.default

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var hasViewAppeared: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self,
                                       selector: #selector(appWillEnterForeground),
                                       name: UIApplication.willEnterForegroundNotification,
                                       object: nil)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
        removeKeyboardObservers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if self.keyboardConstraint != nil {
            self.addKeyboardObservers()
        }

        if !hasViewAppeared {
            userActionsListener?.initialize()
        } else {
            userActionsListener?.resume()
        }

        hasViewAppeared = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if self.keyboardConstraint != nil {
            self.removeKeyboardObservers()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        userActionsListener?.pause()
        super.viewWillDisappear(animated)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    @objc private func appWillEnterForeground() {
        userActionsListener?.resume()
    }
}

extension BaseViewController: AvoidingKeyboardConstraintProtocol {

    var bottomKeyboardConstraint: NSLayoutConstraint? {
        return self.keyboardConstraint
    }

    var defaultSpaceWhenKeyboardIsHidden: CGFloat {
        return self.defaultBottomSpace
    }

}
