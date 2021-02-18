//
//  CustomNavigationController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 18.02.2021.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
            case .push:
                return PresentAnimator()
            case .pop:
                return DismissAnimator()
            default:
                return nil
        }
    }
}
