//
//  ShowsPresenter.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import Foundation

protocol ShowsPresenterProtocol: AnyObject {

}

class ShowsPresenter {
    
    weak var view: ShowsViewProtocol?
    private let request = Request()
    
    init(view: ShowsViewProtocol) {
        self.view = view
    }
    
}

extension ShowsPresenter: ShowsPresenterProtocol {

}

extension ShowsPresenter {
    
    
}
