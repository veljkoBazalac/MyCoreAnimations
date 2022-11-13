//
//  RotateVC.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 3.11.22..
//

import UIKit

class RotateVC: UIViewController {

    let yellowView = UIView()
    let width : CGFloat = 50
    let height : CGFloat = 50
    var currentRotation : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yellowView.backgroundColor = .systemYellow
        view.addSubview(yellowView)
        yellowView.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        yellowView.frame = CGRect(x: view.bounds.midX - width/2,
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
        
        yellowView.layer.add(animation, forKey: "rotate")
        yellowView.layer.transform = CATransform3DMakeRotation(toSide, 0, 0, 1)
    }
}
