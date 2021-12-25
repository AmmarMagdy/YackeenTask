//
//  CustomButton.swift
//  BeCare
//
//  Created by Afnan on 8/6/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: Float {
        get {
            return Float(layer.cornerRadius)
        }
        set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var isRounded: Bool = false {
        didSet {
            self.layer.cornerRadius = self.bounds.height / 2
        }
    }
    
    //-----------------------GRADIENT COLOR----------------------------
    // the gradient start colour
    @IBInspectable var startColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient end colour
    @IBInspectable var endColor: UIColor? {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient angle, in degrees anticlockwise from 0 (east/right)
    @IBInspectable var angle: CGFloat = 270 {
        didSet {
            updateGradient()
        }
    }
    
    // the gradient layer
    private var gradient: CAGradientLayer?
    
    // initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        installGradient()
    }
    
    // Create a gradient and install it on the layer
    private func installGradient() {
        // if there's already a gradient installed on the layer, remove it
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        let gradient = createGradient()
        self.layer.addSublayer(gradient)
        self.gradient = gradient
    }
    
    // Update an existing gradient
    private func updateGradient() {
        if let gradient = self.gradient {
            let startColor = self.startColor ?? UIColor.clear
            let endColor = self.endColor ?? UIColor.clear
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            let (start, end) = gradientPointsForAngle(self.angle)
            gradient.startPoint = start
            gradient.endPoint = end
        }
    }
    
    // create gradient layer
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    // create vector pointing in direction of angle
    private func gradientPointsForAngle(_ angle: CGFloat) -> (CGPoint, CGPoint) {
        // get vector start and end points
        let end = pointForAngle(angle)
        //let start = pointForAngle(angle+180.0)
        let start = oppositePoint(end)
        // convert to gradient space
        let p0 = transformToGradientSpace(start)
        let p1 = transformToGradientSpace(end)
        return (p0, p1)
    }
    
    // get a point corresponding to the angle
    private func pointForAngle(_ angle: CGFloat) -> CGPoint {
        // convert degrees to radians
        let radians = angle * .pi / 180.0
        var x = cos(radians)
        var y = sin(radians)
        // (x,y) is in terms unit circle. Extrapolate to unit square to get full vector length
        if (abs(x) > abs(y)) {
            // extrapolate x to unit length
            x = x > 0 ? 1 : -1
            y = x * tan(radians)
        } else {
            // extrapolate y to unit length
            y = y > 0 ? 1 : -1
            x = y / tan(radians)
        }
        return CGPoint(x: x, y: y)
    }
    
    // transform point in unit space to gradient space
    private func transformToGradientSpace(_ point: CGPoint) -> CGPoint {
        // input point is in signed unit space: (-1,-1) to (1,1)
        // convert to gradient space: (0,0) to (1,1), with flipped Y axis
        return CGPoint(x: (point.x + 1) * 0.5, y: 1.0 - (point.y + 1) * 0.5)
    }
    
    // return the opposite point in the signed unit square
    private func oppositePoint(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: -point.x, y: -point.y)
    }
    
    // ensure the gradient gets initialized when the view is created in IB
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        installGradient()
        updateGradient()
    }
    //-------------------------------------------
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
//    @IBInspectable var isTransformed: Bool = false {
//        didSet {
//            if !Language.shared.isEnglish() {
//                self.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
//            }
//        }
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.isRounded {
            self.layer.cornerRadius = self.bounds.height / 2
        }
        if startColor != nil {
            installGradient()
            updateGradient()
        }
        self.contentEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    }
    
//    @IBInspectable var setAlignment: Bool = false {
//        didSet {
//            if setAlignment {
//                if !Language.shared.isEnglish() {
//                    self.contentHorizontalAlignment = .right
//                    self.titleLabel?.textAlignment = .right
//                } else {
//                    self.contentHorizontalAlignment = .left
//                    self.titleLabel?.textAlignment = .left
//                }
//            }
//        }
//    }
    
//    @IBInspectable var lightFont: CGFloat {
//        get {
//            return self.titleLabel?.font.capHeight ?? 13
//        }
//        set {
//            self.titleLabel?.adjustsFontSizeToFitWidth = true
//            self.titleLabel?.font = UIFont.appFont(ofSize: newValue)
//        }
//    }
    
//    @IBInspectable var boldFont: CGFloat {
//        get {
//            return self.titleLabel?.font.capHeight ?? 13
//        }
//        set {
//            self.titleLabel?.adjustsFontSizeToFitWidth = true
//            self.titleLabel?.font = UIFont.appFontBold(ofSize: newValue)
//        }
//    }
    
//    @IBInspectable var regularFont: CGFloat {
//        get {
//            return self.titleLabel?.font.capHeight ?? 13
//        }
//        set {
//            self.titleLabel?.adjustsFontSizeToFitWidth = true
//            self.titleLabel?.font = UIFont.appFontRegular(ofSize: newValue)
//        }
//    }
//    @IBInspectable var textColorDarkMode: UIColor? {
//        didSet {
//            if DarkModeConfiguration.instance.isInDarkMode() {
//                self.setTitleColor(textColorDarkMode, for: .normal)
//            } else {
//                self.setTitleColor(self.titleLabel?.textColor, for: .normal)
//            }
//        }
//    }
    
    
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 0.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    
}
