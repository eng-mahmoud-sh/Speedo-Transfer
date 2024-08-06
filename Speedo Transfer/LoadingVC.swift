//
//  LoadingVC.swift
//  Speedo Transfer
//

import UIKit

class LoadingVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        let circularPath = UIBezierPath(arcCenter: view.center, radius: 87, startAngle: -(.pi / 2), endAngle: .pi * 1.5, clockwise: true)
        
        
        let backgroundCircleLayer = CAShapeLayer()
        backgroundCircleLayer.path = circularPath.cgPath
        backgroundCircleLayer.fillColor = UIColor.clear.cgColor
        backgroundCircleLayer.strokeColor = UIColor(named: "borderCellColor")?.cgColor
        backgroundCircleLayer.lineWidth = 6
        view.layer.addSublayer(backgroundCircleLayer)
        
        let animatedCircleLayer = CAShapeLayer()
        animatedCircleLayer.path = circularPath.cgPath
        animatedCircleLayer.fillColor = UIColor.clear.cgColor
        animatedCircleLayer.strokeColor = UIColor(named: "ButtonColor")?.cgColor
        animatedCircleLayer.lineWidth = 6
        animatedCircleLayer.lineCap = .square
        animatedCircleLayer.strokeEnd = 0
        view.layer.addSublayer(animatedCircleLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 10
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        animatedCircleLayer.add(animation, forKey: "strokeEndAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
            self.navigateToNextScreen()
        }
        
    }
    
    func navigateToNextScreen() {
        performSegue(withIdentifier: "showOTP", sender: self)
    }
    
    
}
