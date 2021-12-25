//
//  ShowsViewController.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

protocol ShowsViewProtocol: AnyObject {

}

class ShowsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var presenter: ShowsPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegisterCollectionView()
        let request = Request()
        request.requestAPI(router: .showsList("search")) { resultArray in
            let shows = ShowsAPI(from: resultArray).shows
    
        } callbackFail: { statusCode, message in
            print(statusCode, message)
        } callbackEndDueToError: { error in
            print(error)
        }

    }
    
    func setupRegisterCollectionView() {
        collectionView.register(ShowsCollectionCell.nib, forCellWithReuseIdentifier: ShowsCollectionCell.identifier)
    }

}

extension ShowsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        //presenter?.numberOfAdvertisment ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = collectionView.bounds.width * 0.93
        let height = view.bounds.height * 0.5
        return CGSize(width: width , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowsCollectionCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let _ = cell as! ShowsCollectionCell
//        presenter?.configure(cell: cell, at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        presenter?.openAdDetails(indexPath.row)
    }
}

extension ShowsViewController: ShowsViewProtocol {
    
   
}
