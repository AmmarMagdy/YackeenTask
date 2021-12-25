//
//  ShowsCollectionCell.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

class ShowsCollectionCell: UICollectionViewCell {

    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var premieredStringLabel: UILabel!
    @IBOutlet weak var premieredLabel: UILabel!
    @IBOutlet weak var runtimeStringLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var rateStringLabel: UILabel!
    @IBOutlet weak var rateView: FloatRatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
