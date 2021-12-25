//
//  ShowsRoutes.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

enum ShowsRoutes: Route {

    case openShows

    var destination: UIViewController {
        switch self {
        case .openShows:
            return ShowsViewController()

        }
    }

    var style: NaivgationStyle {
        switch self {
//        case .openShows:
//            return .modal(transiton: nil)
        default:
            return .push
        }
    }
}
