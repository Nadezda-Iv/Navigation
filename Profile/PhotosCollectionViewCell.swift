//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 19.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageCollection: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.imageCollection)
        
        let centerX = self.imageCollection.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let centerY = self.imageCollection.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        
        NSLayoutConstraint.activate([centerX, centerY])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageCollection.image = nil
    }
    
    private func setup() {
        contentView.addSubview(imageCollection)
        NSLayoutConstraint.activate([
            imageCollection.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            imageCollection.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            imageCollection.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            imageCollection.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        ])
    }
    

    
}
