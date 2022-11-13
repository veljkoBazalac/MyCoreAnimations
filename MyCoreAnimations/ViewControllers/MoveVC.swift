//
//  MoveVC.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 3.11.22..
//

import UIKit

class MoveVC: UIViewController {

    let yellowView = UIView()
    let width : CGFloat = 50
    let height : CGFloat = 50
    
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
    
    @IBAction func upButtonPressed(_ sender: UIButton) {
        animateMove(end: CGPoint(x: view.bounds.midX,
                                 y: 100 + height/2))
    }
    
    @IBAction func leftButtonPressed(_ sender: UIButton) {
        animateMove(end: CGPoint(x: view.bounds.minX + width/2,
                                 y: (view.bounds.midY * 0.8) + height/2))
    }
    
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        animateMove(end: CGPoint(x: view.bounds.maxX - width/2,
                                 y: (view.bounds.midY * 0.8) + height/2))
    }
    
    
    @IBAction func downButtonPressed(_ sender: UIButton) {
        animateMove(end: CGPoint(x: view.bounds.midX,
                                 y: (view.bounds.maxY * 0.7) - height/2))
    }
    
    
    // MARK: - Animate Move Function
    func animateMove(end: CGPoint) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = yellowView.layer.position
        animation.toValue = end
        animation.duration = 0.5

        yellowView.layer.add(animation, forKey: "move")
        yellowView.layer.position = end // Allows animation to stay in the last position
        /*
         View have 2 layers:
         Model - layer which is in the position where View is created
         Presentation - layer which tracks changes of position until last point
         ! When View goes to last point Presentation layer goes back to Model layer if we dont change Model layer position to be at the last Presentation layer point !
         */
    }

}
