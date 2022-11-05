//
//  RotateVC.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 3.11.22..
//

import UIKit

class RotateVC: UIViewController {

    let redView = UIView()
    let width : CGFloat = 50
    let height : CGFloat = 50
    var currentRotation : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .systemRed
        view.addSubview(redView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        redView.frame = CGRect(x: view.bounds.midX - width/2,
                               y: view.bounds.midY * 0.8,
                               width: width,
                               height: height)
    }

    @IBAction func rotateLeftPressed(_ sender: UIButton) {
        animateRotate(toSide: -CGFloat.pi + (CGFloat.pi / 2))
    }
    
    @IBAction func rotateRightPressed(_ sender: UIButton) {
        animateRotate(toSide: CGFloat.pi / 2)
    }
    
    func animateRotate(toSide: CGFloat) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z") // Rotates over Z axis
        animation.fromValue = currentRotation
        animation.toValue = currentRotation + toSide
        animation.duration = 0.2
        currentRotation = toSide
        
        redView.layer.add(animation, forKey: "rotate")
        redView.layer.transform = CATransform3DMakeRotation(toSide, 0, 0, 1)
    }
}
