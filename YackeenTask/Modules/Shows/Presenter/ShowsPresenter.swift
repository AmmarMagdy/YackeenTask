//
//  ShowsPresenter.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import Foundation

protocol ShowsPresenterProtocol: AnyObject {
    func configure(cell: ShowsCollectionCell, at row: Int)
    var numberOfShows: Int {get}
    func getShows()
}

class ShowsPresenter {
    
    weak var view: ShowsViewProtocol?
    private let request = Request()
    private var shows = [Show]()
    
    init(view: ShowsViewProtocol) {
        self.view = view
    }
    
}

extension ShowsPresenter: ShowsPresenterProtocol {
    var numberOfShows: Int {
        return shows.count
    }
    
    func configure(cell: ShowsCollectionCell, at row: Int) {
        guard shows.count > row else {return }
        let show = shows[row]
        cell.setName(show.name)
        cell.setLink(show.links?.selfLink?.href)
        cell.setImage(show.image?.original)
        cell.setRuntime(show.runtime)
        cell.setPremiered(show.premiered)
        cell.setShowRate(show.rating?.average)
    }
}

extension ShowsPresenter {
    func getShows() {
        let request = Request()
        request.requestAPI(router: .showsList("search")) { resultArray in
            DispatchQueue.main.async {
                self.shows = ShowsAPI(from: resultArray).shows
                self.view?.reloadData()
            }
        } callbackFail: { statusCode, message in
            print(statusCode, message)
        } callbackEndDueToError: { error in
            print(error)
        }
    }
}
