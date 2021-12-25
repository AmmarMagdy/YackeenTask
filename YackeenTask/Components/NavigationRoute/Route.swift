//
//  Route.swift
//  Myto
//
//  Created by Afnan MacBook Pro on 03/08/2021.
//

import UIKit

protocol Route {
    var destination: UIViewController { get }
    var style: NaivgationStyle { get }
}

protocol NavigationRoute: AnyObject {
    func navigate(to route: Route)
    func dismiss(navigateTo route: Route?)
    func popVC()
}

enum NaivgationStyle {
    case modal(transiton: UIModalTransitionStyle?)
    case push
}
