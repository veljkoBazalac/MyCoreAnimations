//
//  CirclingVC.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 3.11.22..
//

import UIKit

class CirclingVC: UIViewController {
    
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create Path on which Shape will fill
        let trackPath = UIBezierPath(arcCenter: view.center,
                                        radius: 100,
                                        startAngle: -.pi/2,
                                        endAngle: 2 * .pi,
                                        clockwise: true)
        
        trackLayer.path = trackPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(trackLayer)
        
    }
    
    @IBAction func leftCirclingPressed(_ sender: UIButton) {
        animateCircling(clockWise: false)
    }
    
    
    @IBAction func rightCirclingPressed(_ sender: UIButton) {
        animateCircling(clockWise: true)
    }
    
    private func animateCircling(clockWise: Bool) {
        // Create Shape that fills the circle
        let shapePath = UIBezierPath(arcCenter: view.center,
                                     radius: 100,
                                     startAngle: clockWise ? (-.pi/2) : (3.5 * .pi),
                                     endAngle: clockWise ? (2 * .pi) : (.pi),
                                     clockwise: clockWise)
        
        shapeLayer.path = shapePath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        // Animation
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 5
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true
        
        shapeLayer.add(animation, forKey: "circling")
    }
  }
