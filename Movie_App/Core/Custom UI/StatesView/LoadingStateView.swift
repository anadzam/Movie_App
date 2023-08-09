//
//  LoadingStateView.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 26.07.23.
//

import UIKit



class LoadingStateView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(circleLayer)
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var circleLayer: CAShapeLayer = {
        let circleLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(arcCenter: CGPoint.zero,
                                      radius: 24,
                                      startAngle: -(CGFloat.pi / 2),
                                      endAngle: -(CGFloat.pi / 2) + (2 * CGFloat.pi),
                                      clockwise: true)
        
        
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = Constants.Colors.yellow_primary.cgColor
        circleLayer.lineWidth = 48
        circleLayer.path = bezierPath.cgPath
        
        return circleLayer
    }()
    
    private lazy var strokeAnimationGroup: CAAnimationGroup = {
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.animations = [strokeStartAnimation, strokeEndAnimation, colorChangeAnimation]
        strokeAnimationGroup.duration = 3
        strokeAnimationGroup.repeatCount = .infinity
        strokeAnimationGroup.timingFunction = .init(name: .easeInEaseOut)
        return strokeAnimationGroup
    }()
    
  

    private lazy var colorChangeAnimation: CABasicAnimation = {
           let colorChangeAnimation = CABasicAnimation(keyPath: "strokeColor")
           colorChangeAnimation.fromValue = Constants.Colors.yellow_primary.cgColor
           let primaryColorWithOpacity = Constants.Colors.yellow_primary.withAlphaComponent(0.6)

          
        colorChangeAnimation.toValue = primaryColorWithOpacity.cgColor
           colorChangeAnimation.duration = 0.5
        colorChangeAnimation.beginTime = strokeEndAnimation.beginTime + strokeEndAnimation.duration - 0.5 
           colorChangeAnimation.fillMode = .forwards
           colorChangeAnimation.isRemovedOnCompletion = false
           return colorChangeAnimation
       }()
    
    private lazy var strokeStartAnimation: CABasicAnimation = {
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = 0
        strokeStartAnimation.toValue = 1
        strokeStartAnimation.duration = 2.5
        strokeStartAnimation.beginTime = 0.5
        
        return strokeStartAnimation
    }()
    
    private lazy var strokeEndAnimation: CABasicAnimation = {
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1
        strokeEndAnimation.duration = 1.5
       
        return strokeEndAnimation
    }()
    
    func startSpinning() {

        circleLayer.add(strokeAnimationGroup, forKey: nil)
    }
    
}
