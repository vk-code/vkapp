//
//  UserController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 24.01.2021.
//

import UIKit

class UserController: UICollectionViewController {
    
    private let reuseIdentifier = "userCell"
    private var photos = ["Joey", "Rachel", "Monica", "Chandler", "Ross", "Phoebe"]
    private lazy var transitioningAnimator = GalleryTransitionAnimatorDelegateImp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photos.shuffle()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let userCell = cell as? UserCell else { return cell }
        
        userCell.photo?.image = UIImage(named: photos[indexPath.row])
        userCell.photo?.isUserInteractionEnabled = true
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(showGallery(_:)))
        userCell.addGestureRecognizer(recognizer)
        
        // MARK: TO DO
        // для каждой ячейки нужно запоминать, нажат ли на ней лайк и в cellForItemAt выставлять этому контролу запомненное состояние
        
        return userCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let userCell = cell as? UserCell else { return }
        
        userCell.photo?.layer.opacity = 0.3
        userCell.photo?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                userCell.photo?.layer.opacity = 1
                userCell.photo?.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
    
    @objc func showGallery(_ recognizer: UITapGestureRecognizer) {
        
        guard let UserVC = recognizer.view as? UserCell else { return }
        
        let galleryVC = ImageGalleryViewController()
        
        for (i, imgName) in photos.enumerated() {
            
            if let image = UIImage(named: imgName) {
                galleryVC.images.append(image)
                
                if image == UserVC.photo?.image {
                    galleryVC.currentImage = i
                }
            }
        }
        
//        galleryVC.modalPresentationStyle = .custom
        let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePanGesture(recognizer:)))
        recognizer.edges = [.top]
        galleryVC.view.addGestureRecognizer(recognizer)
        galleryVC.transitioningDelegate = transitioningAnimator
        
        present(galleryVC, animated: true, completion: nil)
//        navigationController?.pushViewController(galleryVC, animated: true)
    }
    
    @objc func handlePanGesture(recognizer: UIScreenEdgePanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            self.dismiss(animated: true, completion: nil)
             
        case .changed:
            let location = recognizer.translation(in: recognizer.view)
            let estimatedProgress = abs(location.y / 550)
            let progress = min(max(estimatedProgress, 0.01), 0.99)
            transitioningAnimator.dismissInteractionController.update(progress)
            
        case .cancelled, .failed:
            transitioningAnimator.dismissInteractionController.cancel()
            
        case .ended:
            if abs(recognizer.translation(in: recognizer.view).y) < 100 {
                transitioningAnimator.dismissInteractionController.cancel()
            } else {
                transitioningAnimator.dismissInteractionController.finish()
            }
            
        default:
            break
        }
    }
}


extension UserController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
}
