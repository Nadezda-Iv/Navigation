//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 18.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var stackViewHorizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var stackViewLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var imageOneView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = photos[0]
        return imageView
    }()
    
    private lazy var imageTwoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = photos[01]
        return imageView
    }()
    
    private lazy var imageThreeView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = photos[02]
        return imageView
    }()
    
    private lazy var imageFourView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.image = photos[03]
        return imageView
    }()

    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = arrow
        imageView.frame.size = CGSize(width: 15, height: 15)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackViewVertical)
        self.stackViewLabels.addArrangedSubview(self.photosLabel)
        self.stackViewLabels.addArrangedSubview(self.arrowImageView)
        self.stackViewVertical.addArrangedSubview(self.stackViewLabels)
        self.stackViewVertical.addArrangedSubview(self.stackViewHorizontal)
        self.stackViewHorizontal.addArrangedSubview(self.imageOneView)
        self.stackViewHorizontal.addArrangedSubview(self.imageTwoView)
        self.stackViewHorizontal.addArrangedSubview(self.imageThreeView)
        self.stackViewHorizontal.addArrangedSubview(self.imageFourView)
        
        
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        let heightConstraint = self.backView.heightAnchor.constraint(equalToConstant: 130)
        bottomConstraint.priority = UILayoutPriority(rawValue: 130)
        
        
        
        let topStackViewConstraint = self.stackViewVertical.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let bottomStackViewConstraint = self.stackViewVertical.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12)
        let leadingStackViewConstraint = self.stackViewVertical.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let trailingStackViewConstraint = self.stackViewVertical.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        
        let arrowWidthConstraint = self.arrowImageView.widthAnchor.constraint(equalToConstant: 20)
        
        NSLayoutConstraint.activate([ topConstraint, leadingConstraint, trailingConstraint, bottomConstraint, heightConstraint, topStackViewConstraint, bottomStackViewConstraint, leadingStackViewConstraint, trailingStackViewConstraint, arrowWidthConstraint
        ].compactMap({ $0 }))
    }
    
}
