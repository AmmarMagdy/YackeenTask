//
//  UIView+Extension.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import Foundation
import UIKit

extension UIView {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
