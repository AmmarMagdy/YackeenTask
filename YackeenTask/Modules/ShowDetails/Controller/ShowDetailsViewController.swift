//
//  ShowDetailsViewController.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

protocol ShowDetailsViewProtocol: AnyObject {
    func setName(_ name: String?)
    func setImage(_ image: String?)
    func setLink(_ link: String?)
    func setPremiered(_ premiered: String?)
    func setRuntime(_ runtime: Int?)
    func setShowRate(_ rate: Double?)
    func setSummary(_ summary: String?)
}

class ShowDetailsViewController: UIViewController {

    @IBOutlet private weak var showImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var linkButton: UIButton!
    @IBOutlet private weak var premieredStringLabel: UILabel!
    @IBOutlet private weak var premieredLabel: UILabel!
    @IBOutlet private weak var runtimeStringLabel: UILabel!
    @IBOutlet private weak var runtimeLabel: UILabel!
    @IBOutlet private weak var rateView: FloatRatingView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension ShowDetailsViewController: ShowDetailsViewProtocol {
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
    
    func setSummary(_ summary: String?) {
        summaryLabel.text = summary
    }
   
}
