//
//  PhotosViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 19.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
   
    
    var closure: (() -> Void)?

    private var itemCount: CGFloat = 3

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
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
        self.addConstraints()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    private func addConstraints() {

        let photoCollectionTop = self.photoCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let photoCollectionLeading = self.photoCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8)
        let photoCollectionTrailing = self.photoCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        let photoCollectionBottom = self.photoCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([photoCollectionTop, photoCollectionLeading, photoCollectionTrailing, photoCollectionBottom])
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

}
/*
 
 private enum Constants {
     static let itemCount: CGFloat = 3
 }
 
 private lazy var layout: UICollectionViewFlowLayout = {
     let layout = UICollectionViewFlowLayout()
     layout.scrollDirection = .vertical
     layout.minimumLineSpacing = 8
     layout.minimumInteritemSpacing = 8
     return layout
 }()
 
 private lazy var collectionView: UICollectionView = {
     let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
     collectionView.delegate = self
     collectionView.dataSource = self
     collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
     collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
     collectionView.translatesAutoresizingMaskIntoConstraints = false
     return collectionView
 }()

 private var collectionDataSource : [CollectionViewModel] = []

 override func viewDidLoad() {
     super.viewDidLoad()
     self.dataSourceSetup()
     self.setupView()
     self.title = "Photo Gallery"
 }
 
 override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
     navigationController?.navigationBar.isHidden = false
 }

 
 private func setupView() {
     view.addSubview(self.collectionView)
     NSLayoutConstraint.activate([
         collectionView.topAnchor.constraint(equalTo: view.topAnchor),
         collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
     ])
 }
 
 private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
     let neededWidth = width - 4 * spacing
     let itemWidth = floor(neededWidth / Constants.itemCount)
     return CGSize(width: itemWidth, height: itemWidth)
 }
 
 private func dataSourceSetup() {
     for n in 1...21 {
         var name = ""
         if n / 10 < 1 {
             name = "SJ_img0\(n)"
         } else {
             name = "SJ_img\(n)"
         }
         collectionDataSource.append(CollectionViewModel(image: name))
     }
 }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return self.collectionDataSource.count
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
         cell.backgroundColor = .black
         return cell
     }
     cell.backgroundColor = .systemGray6
     let photos = collectionDataSource[indexPath.row]
     cell.photoGalleryImages.image = UIImage(named: photos.image)
     cell.photoGalleryImages.contentMode = .scaleAspectFill
     return cell
 }
 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     let vc = DetailPhotoViewController()
     vc.selectedImage = collectionDataSource[indexPath.row].image
     navigationController?.pushViewController(vc, animated: true)
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
     return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
     let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
     return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
 }
}

 */
