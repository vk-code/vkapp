//
//  LoadingView.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 07.02.2021.
//

import UIKit

class LoadingView: UIViewController {

    @IBOutlet var circle1: UIView?
    @IBOutlet var circle2: UIView?
    @IBOutlet var circle3: UIView?

    private let duration: TimeInterval = 0.5
    private var repeatAfter: Double {
        return self.duration * 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circle1?.layer.cornerRadius = 12.5
        circle1?.layer.opacity = 0.5
        circle2?.layer.cornerRadius = 12.5
        circle2?.layer.opacity = 0.5
        circle3?.layer.cornerRadius = 12.5
        circle3?.layer.opacity = 0.5
        
        animate()
    }
    
    private func animate() {
        repeater()
        
        UIView.animate(withDuration: self.duration) {
            self.circle1?.layer.opacity = 1
        } completion: { _ in
            UIView.animate(withDuration: self.duration) {
                self.circle1?.layer.opacity = 0.5
                self.circle2?.layer.opacity = 1
            } completion: { _ in
                UIView.animate(withDuration: self.duration) {
                    self.circle2?.layer.opacity = 0.5
                    self.circle3?.layer.opacity = 1
                } completion: { _ in
                    UIView.animate(withDuration: self.duration) {
                        self.circle3?.layer.opacity = 0.5
                    }
                }
            }
        }
    }
    
    private func repeater() {
        DispatchQueue.main.asyncAfter(deadline: .now() + self.repeatAfter) {
            self.animate()
        }
    }
}
