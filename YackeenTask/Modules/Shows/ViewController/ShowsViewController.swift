//
//  ShowsViewController.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

protocol ShowsViewProtocol: NavigationRoute {
    func reloadData()
}

class ShowsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: ShowsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegisterCollectionView()
        presenter?.getShows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationItem.title = nil
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
        return presenter?.numberOfShows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = collectionView.bounds.width * 0.9
        let height = view.bounds.height * 0.45
        return CGSize(width: width , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowsCollectionCell.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! ShowsCollectionCell
        presenter?.configure(cell: cell, at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                presenter?.openShowDetails(at: indexPath.row)
    }
}

extension ShowsViewController: ShowsViewProtocol {
    
    func reloadData() {
        collectionView.reloadData()
    }
}
