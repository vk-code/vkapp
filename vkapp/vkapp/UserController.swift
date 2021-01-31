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
        
        return userCell
    }

}


extension UserController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
}
