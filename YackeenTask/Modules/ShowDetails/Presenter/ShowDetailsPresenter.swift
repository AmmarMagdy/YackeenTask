//
//  ShowDetailsPresenter.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import Foundation

protocol ShowDetailsPresenterProtocol: AnyObject {
    func loadViewData()
}

class ShowDetailsPresenter {
    
    weak var view: ShowDetailsViewProtocol?
    private var show: Show
    
    init(view: ShowDetailsViewProtocol, show: Show) {
        self.view = view
        self.show = show
    }
}

extension ShowDetailsPresenter: ShowDetailsPresenterProtocol {
    func loadViewData() {
        view?.setName(show.name)
        view?.setLink(show.links?.selfLink?.href)
        view?.setImage(show.image?.original)
        view?.setRuntime(show.runtime)
        view?.setPremiered(show.premiered)
        view?.setShowRate(show.rating?.average)
        view?.setSummary(show.summary?.htmlToString)
    }
}

