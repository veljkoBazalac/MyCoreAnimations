//
//  ShakeVC.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 3.11.22..
//

import UIKit

class ShakeVC: UIViewController {

    let redView = UIView()
    let width : CGFloat = 50
    let height : CGFloat = 50
    
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
    
    @IBAction func shakeVeticalPressed(_ sender: UIButton) {
        animateShake(path: "position.y")
    }
    
    @IBAction func shakeHorizontalPressed(_ sender: UIButton) {
        animateShake(path: "position.x")
    }
    
    func animateShake(path: String) {
        let animation = CAKeyframeAnimation(keyPath: path)
        animation.values = [0, 10, -10, 10, 0] // Setting changes on X axis for View movements
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1] // Exact time in seconds in which View movements happening.
        animation.duration = 0.4 // Lowering duration can speed up animation and create shake movements
        
        animation.isAdditive = true
        redView.layer.add(animation, forKey: "shake")
    }
}
