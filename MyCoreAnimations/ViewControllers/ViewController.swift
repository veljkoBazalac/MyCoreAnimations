//
//  ViewController.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 2.11.22..
//

import UIKit

class ViewController: UIViewController {

    let redView = UIView()
    let width : CGFloat = 40
    let height : CGFloat = 40
    
    let redCircle = UIImageView()
    let diameter : CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .systemRed
        view.addSubview(redView)
        view.addSubview(redCircle)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        redView.frame = CGRect(x: view.bounds.midX - width/2,
//                               y: view.bounds.midY - height/2,
//                               width: width,
//                               height: height)
        
        //        animateMove()
        //        animateScale()
//                animateRotate()
//        animateShake()
        
        redView.frame = CGRect(x: view.bounds.midX - width/2,
                               y: view.bounds.midY - height/2,
                               width: width,
                               height: height)
        
        redCircle.frame = CGRect(x: view.bounds.midX - diameter/2,
                                 y: view.bounds.midY - diameter/2,
                                 width: diameter,
                                 height: diameter)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: diameter,
                                                            height: diameter))
        
        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0,
                                   y: 0,
                                   width: diameter,
                                   height: diameter)
            
            ctx.cgContext.setStrokeColor(UIColor.red.cgColor)
            ctx.cgContext.setFillColor(UIColor.clear.cgColor)
            ctx.cgContext.setLineWidth(2)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        }
        
        redCircle.image = img
        
        animateCircling()
    }
    
    func animateMove() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = 20 + 140/2
        animation.toValue = 300
        animation.duration = 2
        
        redView.layer.add(animation, forKey: "move")
        redView.layer.position = CGPoint(x: 300, y: 100 + 100/2) // Omogucava da se animacija ne vraca na pocetnu poziciju
        /*
         View ima 2 layera:
         Model - onaj koji se nalazi na mestu na kojem je view prvo kreiran
         Presentation - onaj koji prati kretanje do zadate tacke
         ! Kada View dodje do zadate tacke Presentation layer se vraca na Model layer, zato moramo da dodamo novu poziciju za Model layer !
         */
    }

    func animateScale() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = 3
        animation.duration = 2
        
        redView.layer.add(animation, forKey: "scale")
        redView.layer.transform = CATransform3DMakeScale(3, 3, 1) // X, Y, Z promene u odnosu na toValue
    }
    
    func animateRotate() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z") // Rotira se oko Z ose
        animation.fromValue = 0
        animation.toValue = CGFloat.pi / 2
        animation.duration = 2
        
        redView.layer.add(animation, forKey: "rotate")
        redView.layer.transform = CATransform3DMakeRotation((CGFloat.pi / 2), 0, 0, 1)
    }
    
    func animateShake() {
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [0, 10, -10, 10, 0] // Postavljamo promene po X osi koje ce View da izvodi.
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1] // Tacno vreme u sekundam u kojem ce doci do pomeranja po X osi.
        animation.duration = 0.4 // Vreme za koje ce da se izvrsi animacija, moze da bude krace od keyTimes i na taj nacin se ubrza.
        
        animation.isAdditive = true
        redView.layer.add(animation, forKey: "shake")
    }
    
    func animateCircling() {
        let boundingRect = CGRect(x: -diameter/2, // -poluprecnik
                                 y: -diameter/2, // -poluprecnik
                                 width: diameter, // precnik
                                 height: diameter) // precnik
        
        let orbit = CAKeyframeAnimation(keyPath: "position")
        
        orbit.path = CGPath(ellipseIn: boundingRect, transform: nil) // Odredimo putanju
        orbit.duration = 2
        orbit.isAdditive = true
        orbit.calculationMode = CAAnimationCalculationMode.paced
        orbit.rotationMode = CAAnimationRotationMode.rotateAuto
        orbit.autoreverses = true
        orbit.repeatCount = 3
        
        redView.layer.add(orbit, forKey: "circling")
    }
    
}

