//
//  CustomSegue.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 18.02.2021.
//

import UIKit

final class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        destination.view.frame = transitionContext.containerView.bounds
        destination.view.transform = CGAffineTransform(rotationAngle: 90)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            destination.view.transform = .identity
        } completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
}


final class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        destination.view.frame = transitionContext.containerView.bounds
        source.view.layer.anchorPoint = CGPoint(x: 1, y: 0)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            source.view.transform = CGAffineTransform(rotationAngle: 90)
        } completion: { _ in
            source.view.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
}
