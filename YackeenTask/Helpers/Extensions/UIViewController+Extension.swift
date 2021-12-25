//
//  UIViewController+Extension.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

extension UIViewController: NavigationRoute {
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func navigate(to route: Route) {
        switch route.style {
        case .modal(let transtion):
            self.presentViewController(route.destination, transtion ?? .coverVertical)
        case .push:
            pushViewController(route.destination)
        }
    }
    
    func dismiss(navigateTo route: Route?) {
        self.dismiss(animated: true)
        guard let route = route else {return}
        navigate(to: route)
    }
    
    func presentViewController(_ viewController : UIViewController, _ defaultTranstion: UIModalTransitionStyle = .coverVertical) {
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = defaultTranstion
        self.present(viewController, animated: true, completion: nil)
    }
    
    func pushViewController(_ viewController : UIViewController) {
        if type(of: self) == UINavigationController.self {
            (self as? UINavigationController)?.pushViewController(viewController, animated: true)
        } else if self.presentingViewController != nil {
            (self.presentingViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
        } else {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
