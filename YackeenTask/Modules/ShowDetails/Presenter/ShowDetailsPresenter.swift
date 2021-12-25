//
//  ShowDetailsPresenter.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import Foundation

protocol ShowDetailsPresenterProtocol: AnyObject {
    func getShows()
}

class ShowDetailsPresenter {
    
    weak var view: ShowsViewProtocol?
    private let request = Request()
    private var shows = [Show]()
    
    init(view: ShowsViewProtocol) {
        self.view = view
    }
    
}

extension ShowDetailsPresenter: ShowsPresenterProtocol {
 
}

