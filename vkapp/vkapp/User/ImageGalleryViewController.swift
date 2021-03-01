//
//  ImageGalleryViewController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 11.02.2021.
//

import UIKit

class ImageGalleryViewController: UIViewController {

    var images = [UIImage]()
    var currentImage: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.95)
        
        initFirstImage()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
    }
    
    
    func initFirstImage() {
        
        guard images.count > 0 else { return }
        
        let imageView = UIImageView(image: images[currentImage])
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.view.bounds.width,
                                 height: self.view.bounds.height)
        
        view.addSubview(imageView)
    }
    
    
    @objc func swipe(_ sender: UISwipeGestureRecognizer) {
        
        let totalImages = images.count
        var startXpos: CGFloat = 0
        
        switch sender.direction {
        case .left:
            if currentImage < totalImages {
                currentImage = currentImage + 1 == totalImages ? currentImage : currentImage + 1
            }
            startXpos = self.view.bounds.width
            
        case .right:
            if currentImage > 0 {
                currentImage -= 1
            }
            startXpos = -self.view.bounds.width
            
        default:
            break
        }
        
        changeImage(withImageIndex: currentImage, from: startXpos)
    }
    
    
    private func changeImage(withImageIndex currentImage: Int, from startXpos: CGFloat) {
        
        let image = images[currentImage]
            
        if let prevImageView = view.subviews[0] as? UIImageView {
            
            guard prevImageView.image != image else { return }
            
            UIView.animate(withDuration: 0.3) {
                prevImageView.layer.opacity = 0
                prevImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
            } completion: { _ in
                prevImageView.removeFromSuperview()
            }
        }
        
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: startXpos,
                                 y: 0,
                                 width: self.view.bounds.width,
                                 height: self.view.bounds.height)
        
        view.addSubview(imageView)
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [], animations: {
            imageView.layer.position.x = 0 + imageView.frame.width/2
        })
    }
}
