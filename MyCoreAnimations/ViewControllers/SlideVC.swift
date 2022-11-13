//
//  SlideVC.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 5.11.22..
//

import UIKit

class SlideVC: UIViewController {

    let slidesArray : [UIView] = [UIView(), UIView(), UIView(), UIView(), UIView()]
    
    let width : CGFloat = 300
    let height : CGFloat = 500
    
    private var currentSlide : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstSlide = slidesArray.first {
            view.addSubview(firstSlide)
            
            firstSlide.backgroundColor = .systemYellow
            firstSlide.frame = CGRect(x: view.bounds.midX - width/2,
                                  y: view.bounds.midY - height/2,
                                  width: width,
                                  height: height)
            firstSlide.layer.cornerRadius = 10
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(animateSlideLeft))
            swipeLeft.direction = .left
            firstSlide.addGestureRecognizer(swipeLeft)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        for slide in slidesArray {
            slide.removeFromSuperview()
        }
    }
    
    
    @objc private func animateSlideLeft() {
        
        guard currentSlide < slidesArray.count - 1 else { return }
        
        let slideToMove = slidesArray[currentSlide]
        
        disappearAnimation(toLeft: true, for: slideToMove)
        
        currentSlide += 1
        
        let slideToShow = slidesArray[currentSlide]
        
        // Swipe Left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(animateSlideLeft))
        swipeLeft.direction = .left
        slideToShow.addGestureRecognizer(swipeLeft)
        
        // Swipe Right
        if currentSlide > 0 {
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(animateSlideRight))
            swipeRight.direction = .right
            slideToShow.addGestureRecognizer(swipeRight)
        }
        
        appearAnimation(isLeft: true, for: slideToShow)
    }
    
    // MARK: - Slide Right
    @objc private func animateSlideRight() {
        
        guard currentSlide > 0 else { return }
        
        let slideToMove = slidesArray[currentSlide]
        
        disappearAnimation(toLeft: false, for: slideToMove)
        
        currentSlide -= 1
        
        let slideToShow = slidesArray[currentSlide]
        
        // Swipe Right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(animateSlideRight))
        swipeRight.direction = .right
        slideToShow.addGestureRecognizer(swipeRight)
        
        appearAnimation(isLeft: false, for: slideToShow)
    }
    
    // MARK: - Animate Slide View Disappear
    private func disappearAnimation(toLeft: Bool, for slide: UIView) {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = slide.layer.position
        animation.toValue = CGPoint(x: toLeft ? view.bounds.minX - width : view.bounds.maxX + width, // Change X position based on swipe direction
                                    y: view.bounds.midY)
        animation.duration = 0.4
        
        slide.layer.add(animation, forKey: "disappear")
        slide.layer.position = CGPoint(x: toLeft ? view.bounds.minX - width : view.bounds.maxX + width, // Change X position based on swipe direction
                                       y: view.bounds.midY)
    }
    
    // MARK: - Animate Slide View Appear
    private func appearAnimation(isLeft: Bool, for slide: UIView) {
        
        slide.backgroundColor = .systemYellow
        slide.frame = CGRect(x: isLeft ? view.bounds.maxX + 50 : view.bounds.minX - 50 - width, // Change X position based on swipe direction
                             y: view.bounds.midY - height/2,
                             width: width,
                             height: height)
        slide.layer.cornerRadius = 10
        
        view.addSubview(slide)
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = slide.layer.position
        animation.toValue = CGPoint(x: view.bounds.midX,
                                    y: view.bounds.midY)
        animation.duration = 0.4
        slide.layer.add(animation, forKey: "appear")
        slide.layer.position = CGPoint(x: view.bounds.midX,
                                       y: view.bounds.midY)
    }
}
