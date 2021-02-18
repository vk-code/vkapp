//
//  GalleryTransition.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 18.02.2021.
//

import UIKit

class GalleryTransitionAnimatorDelegateImp: NSObject, UIViewControllerTransitioningDelegate {
    
    var dismissInteractionController = UIPercentDrivenInteractiveTransition()
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentGalleryView()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissGalleryView()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return dismissInteractionController
    }
}


final class PresentGalleryView: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.75
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = transitionContext.containerView.bounds
        destination.view.alpha = 0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            destination.view.alpha = 1
        } completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}


final class DismissGalleryView: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.75
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        destination.view.frame = source.view.frame
//        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext)) {
            source.view.transform = CGAffineTransform(translationX: 0, y: source.view.frame.height)
        } completion: { _ in
            source.view.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
