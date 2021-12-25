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
            let showData = ShowsViewController()
            showData.presenter = ShowsPresenter(view: showData)
            return showData
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
