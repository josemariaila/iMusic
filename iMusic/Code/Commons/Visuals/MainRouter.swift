//
//  MainRouter.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

typealias AcceptActionCompletion = (UIAlertAction) -> Void

protocol MainRouterInterface {
    func show(viewController: UIViewController, sender: Any?)
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?)
    func presentAlertController(withMessage: String, completion: AcceptActionCompletion?)
}

protocol RouterFactory {
    static func create(withMainRouter mainRouter: MainRouterInterface) -> UIViewController
}

class MainRouter {
    let window: UIWindow
    
    var rootViewController: UIViewController {
        
        guard let rootViewController = window.rootViewController else {
            fatalError("There is no rootViewController installed on the window")
        }
        
        return rootViewController
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    static func apply(_ window: UIWindow) {
        MainRouter.applyWindowStyle(window)
        MainRouter.applyNavigationBarStyle()
    }
    
    func showRootViewController() {
        showSearchViewController()
    }
    
    func showSearchViewController() {
        let searchViewController = SearchRouter.create(withMainRouter: self)
        let rootViewController = UINavigationController(rootViewController: searchViewController)
        window.rootViewController = rootViewController
    }
}

private extension MainRouter {
    
    static func applyWindowStyle(_ window: UIWindow) {
        window.backgroundColor = AppColors.white
        window.tintColor = AppColors.black
    }
    
    static func applyNavigationBarStyle() {
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = AppColors.black
        appearance.barTintColor = AppColors.white
        appearance.isTranslucent = false
        appearance.isHidden = false
    }
}

extension MainRouter: MainRouterInterface {
    
    func show(viewController: UIViewController, sender: Any?) {
        rootViewController.show(viewController, sender: sender)
    }
    
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?) {
        rootViewController.present(viewController, animated: animated, completion: completion)
    }
    
    func presentAlertController(withMessage: String, completion: AcceptActionCompletion?) {
        
        let alertController = UIAlertController(title: Strings.error.value,
                                                message: withMessage,
                                                preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: Strings.accept.value,
                                         style: .default,
                                         handler: completion)
        
        alertController.addAction(acceptAction)
        present(viewController: alertController, animated: true, completion: nil)
    }
}
