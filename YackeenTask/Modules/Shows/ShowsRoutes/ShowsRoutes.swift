//
//  ShowsRoutes.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

enum ShowsRoutes: Route {
    
    case openShows
    case openShowDetails(show: Show)
    
    var destination: UIViewController {
        switch self {
        case .openShows:
            let viewController = ShowsViewController()
            viewController.presenter = ShowsPresenter(view: viewController)
            return viewController
            
        case .openShowDetails(show: let show):
            let viewController = ShowDetailsViewController()
            viewController.presenter = ShowDetailsPresenter(view: viewController, show: show)
            return viewController
        }
    }
    
    var style: NaivgationStyle {
        switch self {
        default:
            return .push
        }
    }
}
