//
//  PhotosViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 19.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private var tap = UITapGestureRecognizer()
    
    private var itemCount: CGFloat = 3

    private lazy var alphaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    lazy var imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: 80, height: 80)
        imageView.alpha = 0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.alpha = 0
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "img_230392"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(exitAnimationImage), for: .touchUpInside)
        return button
    }()

    private lazy var photoCollectionView: UICollectionView = {
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        photoCollection.dataSource = self
        photoCollection.delegate = self
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        photoCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        return photoCollection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.backButtonTitle = "Back"
        self.navigationItem.title = "Photo Gallery"
        self.view.addSubview(self.photoCollectionView)
     
        self.view.addSubview(alphaView)
        self.alphaView.addSubview(exitButton)
        self.alphaView.addSubview(imageview)
        self.addConstraints()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    private func addConstraints() {
        
        let screen = UIScreen.main.bounds
        let screenWidth = screen.size.width
        
        NSLayoutConstraint.activate([
            
            self.photoCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.photoCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            self.photoCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            self.photoCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            self.alphaView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.alphaView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.alphaView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.alphaView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            
            self.imageview.centerXAnchor.constraint(equalTo: self.alphaView.centerXAnchor),
            self.imageview.centerYAnchor.constraint(equalTo: self.alphaView.centerYAnchor),
            self.imageview.widthAnchor.constraint(equalToConstant: screenWidth),
            self.imageview.heightAnchor.constraint(equalToConstant: screenWidth),
            
            
            self.exitButton.topAnchor.constraint(equalTo: self.alphaView.topAnchor, constant: 25),
            self.exitButton.rightAnchor.constraint(equalTo: self.alphaView.rightAnchor, constant: -20),
            self.exitButton.heightAnchor.constraint(equalToConstant: 30),
            self.exitButton.widthAnchor.constraint(equalToConstant: 30)
            
        ])
    }

    private var dataSource = photos

    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 2 * spacing
        let itemWidth = floor(neededWidth / itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let photo = self.dataSource[indexPath.row]
        cell.setup(photo: photo!)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (photoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: photoCollectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut , .beginFromCurrentState], animations: {
        let f = self.dataSource[indexPath.item]
        self.alphaView.alpha = 1
        self.imageview.alpha = 1
        self.imageview.image = f
        })
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.exitButton.alpha = 1
        }
        
    }
    
    @objc private func exitAnimationImage(sender: UIButton!) {
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.exitButton.alpha = 0
        }
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut , .beginFromCurrentState], animations: {
            self.alphaView.alpha = 0
            self.imageview.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    
}
