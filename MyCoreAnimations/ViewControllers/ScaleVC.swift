//
//  ScaleVC.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 3.11.22..
//

import UIKit

class ScaleVC: UIViewController {

    let yellowView = UIView()
    let width : CGFloat = 50
    let height : CGFloat = 50
    var currentScale : CGFloat = 1
    
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
    
    @IBAction func scaleUpPressed(_ sender: UIButton) {
        animateScale(scaleTo: 3)
    }
    
    
    @IBAction func scaleDownPressed(_ sender: UIButton) {
        animateScale(scaleTo: 1)
    }
    
    
    func animateScale(scaleTo: CGFloat) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = currentScale
        animation.toValue = scaleTo
        animation.duration = 0.5
        currentScale = scaleTo
        
        yellowView.layer.add(animation, forKey: "scale")
        yellowView.layer.transform = CATransform3DMakeScale(scaleTo, scaleTo, 1) // X, Y, Z changes based on animation.toValue
    }

}
