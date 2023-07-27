//
//  LoadingStateView.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 26.07.23.
//

import UIKit

class LoadingStateView: UIView {
    
    let loadingState = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLoadingState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureLoadingState() {
        frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let rectangle = self.bounds
        let circlePath = UIBezierPath(ovalIn: rectangle)
        
        loadingState.path = circlePath.cgPath
        loadingState.fillColor = UIColor.clear.cgColor
        loadingState.strokeColor = Constants.Colors.yellow_primary.cgColor
        loadingState.lineWidth = 10.0
        loadingState.strokeEnd = 0.25
        loadingState.lineCap = .round
        
        self.layer.addSublayer(loadingState)
    }
    
    func animateLoadingState() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        })  {(completed)  in
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
                self.transform = CGAffineTransform(rotationAngle: 0)
            }) { (completed) in
                self.animateLoadingState()
                
            }
        }
    }
}
