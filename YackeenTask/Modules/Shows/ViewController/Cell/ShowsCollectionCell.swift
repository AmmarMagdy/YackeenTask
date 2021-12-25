//
//  ShowsCollectionCell.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

class ShowsCollectionCell: UICollectionViewCell {

    @IBOutlet private weak var showImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var linkButton: UIButton!
    @IBOutlet private weak var premieredStringLabel: UILabel!
    @IBOutlet private weak var premieredLabel: UILabel!
    @IBOutlet private weak var runtimeStringLabel: UILabel!
    @IBOutlet private weak var runtimeLabel: UILabel!
    @IBOutlet private weak var rateView: FloatRatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setName(_ name: String?) {
        nameLabel.text = name
    }
    
    func setImage(_ image: String?) {
        UIImage.loadFrom(url: image, completion: { image in
            self.showImageView.image = image
        })
    }
    
    func setLink(_ link: String?) {
        linkButton.setTitle(link, for: .normal)
    }
    
    func setPremiered(_ premiered: String?) {
        premieredLabel.text = premiered
    }
    
    func setRuntime(_ runtime: Int?) {
        guard let runtime = runtime else { return }
        runtimeLabel.text = "\(runtime)"
    }

    func setShowRate(_ rate: Double?) {
        rateView.rating = rate ?? 0
    }
}
