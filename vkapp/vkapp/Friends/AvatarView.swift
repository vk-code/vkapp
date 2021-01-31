//
//  AvatarView.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 28.01.2021.
//

import UIKit

class AvatarView: UIView {

    @IBInspectable var shadowColor: UIColor?
    @IBInspectable var shadowOpacity: CGFloat = 0.3 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 2 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBOutlet private var userPhoto: UIImageView?
    @IBOutlet private var shadowView: UIView?
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = frame.width / 2
    }
    
    
    func setPhoto(_ source: UIImage?) {
        guard let image = source else { return }
        guard let imageView = userPhoto else { return }
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = image
        
        setShadow()
    }
    
    
    private func setShadow() {
        guard let shadow = shadowView else { return }
        
        shadow.backgroundColor = .white
        shadow.layer.cornerRadius = shadow.frame.width / 2
        shadow.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadow.layer.shadowOpacity = Float(shadowOpacity)
        shadow.layer.shadowRadius = shadowRadius
        shadow.layer.shadowColor = shadowColor?.cgColor
    }
}
