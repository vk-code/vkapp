//
//  UserController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 24.01.2021.
//

import UIKit

class UserController: UICollectionViewController {
    
    private let reuseIdentifier = "userCell"
    private let photos = ["Joey", "Rachel", "Monica", "Chandler", "Ross", "Phoebe"]

    override func viewDidLoad() {
        super.viewDidLoad()
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
}


extension UserController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
}
