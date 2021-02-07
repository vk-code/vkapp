//
//  LikeControl.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 31.01.2021.
//

import UIKit

@IBDesignable class LikeControl: UIControl {

    private var stackView = UIStackView()
    private var likeText: String {
        return "\(likesCount)"
    }
    var likesCount: Int = 0 {
        didSet {
            self.sendActions(for: .valueChanged)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    func setupView() {
        
        let likeBtn = UIButton()
        likeBtn.imageView?.tintColor = .gray
        likeBtn.imageView?.contentMode = .scaleAspectFit
        likeBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        likeBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        likeBtn.setTitle(likeText, for: .normal)
        likeBtn.setTitleColor(.gray, for: .normal)
        likeBtn.setTitleColor(.red, for: .selected)
        likeBtn.titleLabel?.font = likeBtn.titleLabel?.font.withSize(15)
        likeBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
        likeBtn.addTarget(self, action: #selector(onTap(_:)), for: .touchUpInside)
        
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.addArrangedSubview(likeBtn)

        self.addSubview(stackView)
    }
    
    
    @objc private func onTap(_ sender: UIButton) {
        
        var tintColor: UIColor
        var uiState: UIControl.State
        
        if sender.isSelected {
            likesCount -= 1
            tintColor = .gray
            uiState = .normal
        } else {
            likesCount += 1
            tintColor = .red
            uiState = .selected
        }
        
        sender.isSelected = !sender.isSelected
        sender.imageView?.tintColor = tintColor
        sender.setTitle(likeText, for: uiState)
        UIView.transition(with: sender,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: {
                            sender.setTitle(self.likeText, for: uiState)
                          })

    }
    
    
    private func likeBtnTextTpl() -> String {
        return "\(likeText): \(likesCount)"
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
}
