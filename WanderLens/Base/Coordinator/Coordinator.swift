//
//  Coordinator.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var window: UIWindow { get }
    var interactor: Interactor { get set }
    var childCoordinators: [Coordinator] { get set }
    
    init(interactor: Interactor)
    
    /**
     Starts a new flow.
     
     Use this function to initiate the first screen of the flow.
     */
    func start()
    
    /**
     Finishes the flow.
     
     Use this function to execute common business logic when finishing (exiting) the flow.
     - Note:
     Remember to call `parentCoordinator?.childDidFinish(self)` to de-allocate the coordinator.
     */
    func finish()
    
    /**
     Implement for close button ( ✕ ) functionality.
     
     - NOTE: Remember in case of finishing the whole flow to call `finish()` function, so the child coordinator will be de-allocated the coordinator. Otherwise - memory leaks are likely to happen.
     */
    func didTapCloseButton()
    
    /**
     Implement for back button ( → ) functionality.
     */
    func didTapBackButton()
}

extension Coordinator {
    
    private var presentingNavigationController: UINavigationController? {
        rootViewController()?.presentingViewController as? UINavigationController
    }
    
    var window: UIWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
            return nil
        }
        return window
    }
    
    var rootNavigationController: UINavigationController? {
        
        if let navigationController = rootViewController() as? UINavigationController {
            return navigationController
        }
        
        return rootViewController()?.navigationController
    }
    
    func rootViewController(_ base: UIViewController? = UIWindow.main?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return rootViewController(nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                
                if (selected as? UINavigationController)?.viewControllers.isEmpty ?? false {
                    return rootViewController(tab.moreNavigationController)
                }
                
                return rootViewController(selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return rootViewController(presented)
        }
        return base
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true, completion: EmptyCompletion? = nil) {
        rootViewController()?.navigationController?.pushViewController(viewController, animated: animated, completion: { completion?() })
    }
    
    func popViewController(animated: Bool = true, completion: EmptyCompletion? = nil) {
        rootViewController()?.navigationController?.popViewController(animated: animated, completion: { completion?() })
    }
    
    func present(_ viewController: UIViewController, presentationStyle: UIModalPresentationStyle = .automatic, transitionStyle: UIModalTransitionStyle = .coverVertical, animated: Bool = true, completion: EmptyCompletion? = nil) {
        viewController.modalPresentationStyle = presentationStyle
        viewController.modalTransitionStyle = transitionStyle
        rootViewController()?.present(viewController, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: EmptyCompletion? = nil) {
        rootViewController()?.dismiss(animated: animated, completion: completion)
    }
    
    /**
     De-allocates a child coordinator from its parent.
     
     - parameters:
        - child: the instance of the child coordinator (usually using `self`) to de-allocate.
     */
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                #if DEBUG
                printChildRemoval(coordinator)
                #endif
                break
            }
        }
    }
    
    /**
     Pushes a view controller onto the receiver’s stack and updates the display.
     Pushes a `viewController` onto the presenting `navigationController` (behind the current presented one), instead of pushing on the presented one.
     
     - parameter viewController: The `viewController` to be pushed.
     - parameter animated: `True` animates the push action (will not be seen anyway - unless the dismissed stack is not animated).
     */
    private func pushOnPresenting(_ viewController: UIViewController, animated: Bool = false) {
        presentingNavigationController?.pushViewController(viewController, animated: animated)
    }
    
    func didTapCloseButton() {
        // Keep empty as this is the main app coordinator and it should not close
    }
    
    func didTapBackButton() {
        if rootViewController()?.navigationController?.viewControllers.count == 1 {
            dismiss()
        } else {
            rootViewController()?.navigationController?.popViewController(animated: true)
        }
    }
    
    #if DEBUG
    func printChildRemoval(_ child: Coordinator) {
        print("👋🏼 \(String(describing: type(of: child))) was removed from its parent (\(String(describing: type(of: self))))")
    }
    #endif
}
