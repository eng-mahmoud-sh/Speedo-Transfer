//
//  UiView+background2.swift
//  Speedo Transfer
//

import UIKit
class GradientBackgroundView2: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient2()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient2()
    }
    private func setupGradient2() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = [UIColor(red: 255/255, green: 248/255, blue: 231/255, alpha: 1).cgColor, // لون كريمي فاتح
            UIColor(red: 255/255, green: 234/255, blue: 238/255, alpha: 1).cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
        override func layoutSubviews() {
            super.layoutSubviews()
            self.layer.sublayers?.first?.frame = self.bounds
        }
    }
