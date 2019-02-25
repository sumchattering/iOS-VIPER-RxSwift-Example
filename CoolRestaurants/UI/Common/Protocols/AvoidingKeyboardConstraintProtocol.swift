//
//  AvoidingKeyboardConstraintProtocol.swift
//  CoolRestaurants
//
//  Created by Sumeru Chatterjee on 25/02/2019.
//  Copyright © 2019 Sumeru Chatterjee. All rights reserved.
//

import Foundation
import UIKit

protocol AvoidingKeyboardConstraintProtocol: class {
    var keyboardWillShowObserver: AnyObject? { get set }
    var keyboardWillHideObserver: AnyObject? { get set }
    var bottomKeyboardConstraint: NSLayoutConstraint? { get }
    var defaultSpaceWhenKeyboardIsHidden: CGFloat { get }
}

extension AvoidingKeyboardConstraintProtocol where Self: UIViewController {
    typealias KeyboardShownBlock = (Notification) -> ()
    typealias KeyboardHiddenBlock = (Notification) -> ()
    
    func addKeyboardObservers(keyboardShownBlock: KeyboardShownBlock? = nil, keyboardHiddenBlock: KeyboardHiddenBlock? = nil) {
        self.keyboardWillShowObserver = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil, using: {
            [weak self] notification in
            self?.keyboardWillAppear(notification)
            keyboardShownBlock?(notification)
        })
        
        self.keyboardWillHideObserver = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil, using: {
            [weak self] notification in
            self?.keyboardWillDisappear(notification)
            keyboardHiddenBlock?(notification)
        })
    }
    
    func removeKeyboardObservers() {
        if let keyboardWillShowObserver = self.keyboardWillShowObserver {
            NotificationCenter.default.removeObserver(keyboardWillShowObserver)
        }
        
        if let keyboardWillHideObserver = self.keyboardWillHideObserver {
            NotificationCenter.default.removeObserver(keyboardWillHideObserver)
        }
    }
    
    private func keyboardWillAppear(_ notification: Notification) {
        guard let bottomKeyboardConstraint = self.bottomKeyboardConstraint else {
            return
        }
        
        if let keyboardInfo = notification.userInfo {
            if let duration = (keyboardInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
                let endFrame = (keyboardInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                UIView.animate(withDuration: duration, animations: {
                    bottomKeyboardConstraint.constant = self.defaultSpaceWhenKeyboardIsHidden + endFrame.size.height
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    private func keyboardWillDisappear(_ notification: Notification) {
        guard let bottomKeyboardConstraint = self.bottomKeyboardConstraint else {
            return
        }
        
        if let keyboardInfo = notification.userInfo {
            if let duration = (keyboardInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue {
                UIView.animate(withDuration: duration, animations: {
                    bottomKeyboardConstraint.constant = self.defaultSpaceWhenKeyboardIsHidden
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
}

