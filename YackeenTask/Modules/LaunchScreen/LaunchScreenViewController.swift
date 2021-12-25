//
//  LaunchScreenViewController.swift
//  Myto
//
//  Created by Afnan MacBook Pro on 30/06/2021.
//

import UIKit


class LaunchScreenViewController: UIViewController {
        
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.splashTimeOut(_:)), userInfo: nil, repeats: false)
    }
    
    @objc func splashTimeOut(_ timer: Timer?) {
        guard let timer = self.timer else { return }
        timer.invalidate()
        self.navigate(to: ShowsRoutes.openShows)
    }
}
