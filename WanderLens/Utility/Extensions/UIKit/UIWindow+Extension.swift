//
//  UIWindow+Extension.swift
//  WanderLens
//
//  Created by Telem Tobi on 17/09/2023.
//

import UIKit

extension UIWindow {
    
    static var main: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
            return nil
        }
        return window
    }
    
    func setRootViewController(_ viewController: UIViewController, transitionType type: CATransitionType, transitionSubType subType: CATransitionSubtype? = nil, duration: Double = 0.3, completion: EmptyCompletion? = nil) {
        let transition = CATransition()
        transition.duration = duration
        transition.type = type
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        if subType != nil { transition.subtype = subType }
        layer.add(transition, forKey: kCATransition)
        rootViewController = viewController
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            completion?()
        }
    }
}
