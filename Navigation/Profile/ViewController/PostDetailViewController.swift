//
//  PostDetailViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 11.04.2022.
//

import UIKit

class PostDetailViewController: UIViewController {

     var author: String?  // никнейм автора публикации
     var descriptionText: String? // текст публикации
     var image: String? // имя картинки из каталога Assets.xcassets
     var likes: Int? // количество лайков
     var views: Int? // количество просмотров
     

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
      
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = author
        
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: image ?? "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "System", size: 14)
        label.text = descriptionText
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        //label.isUserInteractionEnabled = true
        label.text = "Likes: \(likes ?? 0)"
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "Views: \(views ?? 0 )"
        label.textAlignment = .right
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.view.backgroundColor = .white
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.backButtonTitle = "Back"
        
        self.view.addSubview(scrollView)
        //self.scrollView.addSubview(infoStackView)
        self.scrollView.addSubview(headerLabel)
        self.scrollView.addSubview(descriptionLabel)
        self.scrollView.addSubview(pictureImageView)
        self.scrollView.addSubview(likesLabel)
        self.scrollView.addSubview(viewsLabel)
      
        NSLayoutConstraint.activate([
            
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -15),
            
            
            self.headerLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 15),
            self.headerLabel.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 15),
            self.headerLabel.heightAnchor.constraint(equalToConstant: 80),
            
            self.pictureImageView.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 40),
            self.pictureImageView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.pictureImageView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -15),
            self.pictureImageView.heightAnchor.constraint(equalToConstant: 250),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.pictureImageView.bottomAnchor, constant: 90),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor),
            self.descriptionLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -15),
            
            self.likesLabel.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor),
            self.likesLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.likesLabel.heightAnchor.constraint(equalToConstant: 50),
            
            self.viewsLabel.rightAnchor.constraint(equalTo: self.pictureImageView.rightAnchor),
            self.viewsLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.viewsLabel.heightAnchor.constraint(equalToConstant: 50),
            self.viewsLabel.widthAnchor.constraint(equalToConstant: 150)
        ].compactMap({ $0 }))
        
    }

}
