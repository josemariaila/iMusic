//
//  MainRouter.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

typealias AcceptActionCompletion = (UIAlertAction) -> Void

protocol MainRouter {
    func show(viewController: UIViewController, sender: Any?)
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?)
    func presentAlertController(withMessage: String, completion: AcceptActionCompletion?)
}

protocol RouterFactory {
    static func create(with mainRouter: MainRouter) -> UIViewController
}

class MainRouterImpl {
    let window: UIWindow
    
    var rootViewController: UIViewController {
        guard let rootViewController = window.rootViewController else { return installRootViewController(with: SearchRouterImpl.create(with: self)) }
        return rootViewController
    }
    
    init(window: UIWindow) {
        self.window = window

        window.rootViewController = installRootViewController(with: SearchRouterImpl.create(with: self))

        UINavigationBar.style()
    }
    
    func installRootViewController(with controller: UIViewController) -> UIViewController {
        return UINavigationController(rootViewController: controller)
    }
}

extension MainRouterImpl: MainRouter {
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
