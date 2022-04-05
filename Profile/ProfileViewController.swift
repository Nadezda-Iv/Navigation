//
//  ProfileViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 22.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    
    private var tap = UITapGestureRecognizer()
    
    private lazy var exitButton: UIButton = {
         let button = UIButton()
         button.layer.cornerRadius = 20
         button.alpha = 1
         button.clipsToBounds = true
         button.setBackgroundImage(UIImage(named: "img_230392"), for: .normal)
         //button.addTarget(self, action: #selector(self.didTapSetStatusButton), for: .touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    

        lazy var imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.backgroundColor = .systemRed
       
        imageView.layer.borderWidth = 3
        imageView.frame.size = CGSize(width: 80, height: 80)
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.alpha = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var alphaForTableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 1
        return view
    }()
    
    private lazy var changeTitleButton: UIButton = {
        let button = UIButton()
         button.backgroundColor = .systemBlue
         button.setTitle("Change title", for: .normal)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
      }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.backgroundColor = .clear
        tableView.backgroundColor = .systemGray6
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        return tableView
    }()
    
    
    private lazy var jsonDecoder: JSONDecoder = {
        return JSONDecoder()
    }()
    
    private var dataSource: [News.Article] = []
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    private var imageViewTopConstraint: NSLayoutConstraint?
    private var imageViewLeftConstraint: NSLayoutConstraint?
    
    var profile: ProfileInfo = {
        return ProfileInfo(userName: "Joke", status: "some state", imageName: "avatar")
    }()
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
       profileHeaderView.statusButton.addTarget(self, action: #selector(printProfileState), for: .touchUpInside)
        profileHeaderView.textField.addTarget(self, action: #selector(changeProfileState), for: .editingChanged)
        self.changeTitleButton.addTarget(self, action: #selector(changingTitle), for: .touchUpInside)
        
        view.addSubview(profileHeaderView)
        self.profileHeaderView = profileHeaderView  
    }
    
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
        //self.animation()
        self.fetchArticles { [weak self] articles in
            self?.dataSource = articles
            self?.tableView.reloadData()
        }
    }

    private func setupView() {
        
        
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.addSubview(self.changeTitleButton)
        self.view.addSubview(self.tableView)
        self.tableView.backgroundColor = .red
        self.view.addSubview(self.profileHeaderView)
       // self.view.addSubview(self.exitButton)
        //view.bringSubviewToFront(self.exitButton)
        
        self.view.addSubview(self.alphaForTableView)
        self.alphaForTableView.addSubview(self.imageview)
        self.alphaForTableView.addSubview(self.exitButton)
        self.view.bringSubviewToFront(self.alphaForTableView)
        self.alphaForTableView.alpha = 1
        
        self.imageViewTopConstraint = imageview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.imageViewLeftConstraint = imageview.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16)
        
        
        let alphaTop = self.alphaForTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let alphsLeading = self.alphaForTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let alphaTrailing = self.alphaForTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let alphaBottom = self.alphaForTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        
        let topExitbutton = self.exitButton.topAnchor.constraint(equalTo: self.alphaForTableView.topAnchor, constant: 25)
        let rightExitButton = self.exitButton.rightAnchor.constraint(equalTo: self.alphaForTableView.rightAnchor, constant: -25)
        let wightExitButton = self.exitButton.widthAnchor.constraint(equalToConstant: 25)
        let heightExitButton  = self.exitButton.heightAnchor.constraint(equalToConstant: 25)
        
        let avatarTop = imageview.widthAnchor.constraint(equalToConstant: 80)
        let avatarHeight = imageview.heightAnchor.constraint(equalToConstant: 80)
      
        
        let tableViewTopConstraint = self.tableView.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor)
        let tableViewLeadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let tableViewTrailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let tableViewBottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.changeTitleButton.topAnchor)
        
        let changeButtonHeightConstraint = self.changeTitleButton.heightAnchor.constraint(equalToConstant: 50)
        let changeButtonLeadingConstraint = self.changeTitleButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let changeButtonTrailingConstraint = self.changeTitleButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let changeButtonBottomConstraint = self.changeTitleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint, tableViewTopConstraint, tableViewLeadingConstraint, tableViewTrailingConstraint, tableViewBottomConstraint, changeButtonBottomConstraint, changeButtonHeightConstraint, changeButtonLeadingConstraint, changeButtonTrailingConstraint,
                alphaTop, alphaBottom, alphsLeading, alphaTrailing,
            topExitbutton, rightExitButton, wightExitButton, heightExitButton,
            avatarTop, avatarHeight, self.imageViewTopConstraint, self.imageViewLeftConstraint
        ].compactMap({ $0 }))
        
    }
    
    
    @objc private func printProfileState()
    {
        self.profileHeaderView.statusLabel.text = profile.status
        self.profileHeaderView.statusLabel.setNeedsDisplay()
    }
    
    @objc private func changeProfileState(_ textField: UITextField)
    {
        profile.status = String(textField.text ?? profile.status)
        print(profile.status)
    }
    
    
    @objc private func changingTitle() {
        print("rty")
        self.title = "new "
    }
    
    private func fetchArticles(completion: @escaping ([News.Article]) -> Void) {
        if let path = Bundle.main.path(forResource: "news", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let news = try self.jsonDecoder.decode(News.self, from: data)
                completion(news.articles)
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            fatalError("Invalid filename/path.")
        }
    }
    
    
    
    private func didTapPhotoCell() {
        let photoVC = PhotosViewController()
        photoVC.closure = {
        }
        self.navigationController?.pushViewController(photoVC, animated: true)
    }
    
 /*   private func animation() {
        if self.profileHeaderView.isTap == true {
            print("fe")
            self.heightConstraint?.isActive = false
            self.heightConstraint = self.profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            NSLayoutConstraint.activate([
             heightConstraint
            ].compactMap({ $0 }))
            print("true")
        } else {
            print("beeee")
        }
    } */
    
    
    private func setupGesture() {
        self.tap.addTarget(self, action: #selector(self.handleTap(_ :)))
        self.imageview.addGestureRecognizer(self.tap)
        print("tap")
    }

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
      let tapLocation = gesture.location(in: imageview.superview)
      if (imageview.layer.presentation()?.frame.contains(tapLocation))! {
        print("Bug tapped!")
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseOut , .beginFromCurrentState], animations: {
            //self.isTap = true
            self.exitButton.alpha = 1
            //self.alphaView.alpha = 0
            self.imageview.alpha = 1.5
            self.imageViewTopConstraint?.isActive = false
            self.imageViewLeftConstraint?.isActive = false
            self.imageViewTopConstraint = self.imageview.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
            self.imageViewLeftConstraint = self.imageview.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
            NSLayoutConstraint.activate([
                self.imageViewLeftConstraint, self.imageViewTopConstraint
            ].compactMap({ $0 }))
            
          self.imageview.transform = CGAffineTransform(scaleX: 5, y: 5)
        }, completion: { finished in
          UIView.animate(withDuration: 2.0, delay: 2.0, options: [], animations: {
            //self.imageview.alpha = 0.0
          }, completion: { finished in
              self.imageview.transform = CGAffineTransform(scaleX: 1, y: 1)
            //self.imageview.removeFromSuperview()
          })
        })
      } else {
        print("Bug not tapped!")
      }
    }
    

    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 1
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as? PhotosTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            let article = self.dataSource[indexPath.row - 1]
            let viewModel = PostTableViewCell.Post(author: article.author, description: article.description, image: article.image, likes: Int(article.likes) ?? 0, views: Int(article.views) ?? 0)
            cell.setup(with: viewModel)
            return cell
        }
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else { return }
    }
}

