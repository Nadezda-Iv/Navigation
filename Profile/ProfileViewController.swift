//
//  ProfileViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 22.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private var tap = UITapGestureRecognizer()
    
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joker"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Smile"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isHidden = false
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        return textField
    }()
    
    lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.alpha = 0
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "img_230392"), for: .normal)
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
        
        statusButton.addTarget(self, action: #selector(printProfileState), for: .touchUpInside)
        textField.addTarget(self, action: #selector(changeProfileState), for: .editingChanged)
        self.changeTitleButton.addTarget(self, action: #selector(changingTitle), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(exitAnimationAvatar), for: .touchUpInside)
    }
    
    private var heightConstraint: NSLayoutConstraint?
    private var alphaBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
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
        self.view.addSubview(self.imageview)
        self.view.addSubview(self.exitButton)
        
        self.view.addSubview(self.alphaForTableView)
        
        self.alphaForTableView.addSubview(labelsStackView)
        self.alphaForTableView.addSubview(statusButton)
        self.alphaForTableView.addSubview(textField)
        
        self.labelsStackView.addSubview(nameLabel)
        self.labelsStackView.addSubview(statusLabel)
        
        
        self.alphaForTableView.alpha = 1
        self.view.bringSubviewToFront(self.imageview)
        self.view.bringSubviewToFront(self.exitButton)
        
        
        
        self.imageViewTopConstraint = imageview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.imageViewLeftConstraint = imageview.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16)
        
        
        let alphaTop = self.alphaForTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let alphsLeading = self.alphaForTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let alphaTrailing = self.alphaForTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        alphaBottomConstraint = self.alphaForTableView.heightAnchor.constraint(equalToConstant: 220)
        
        
        
        let labelStackTopConstraint = labelsStackView.topAnchor.constraint(equalTo: alphaForTableView.topAnchor, constant: 16)
        let labelStackLeftConstraint = labelsStackView.leftAnchor.constraint(equalTo: alphaForTableView.leftAnchor, constant: 150)
        let labelStackRightConstraint = labelsStackView.rightAnchor.constraint(equalTo: alphaForTableView.rightAnchor, constant: -16)
        let labelStackBottomConstraint = labelsStackView.heightAnchor.constraint(equalToConstant: 150)
        
        let labelTop = statusLabel.topAnchor.constraint(equalTo: labelsStackView.topAnchor, constant: 25)
        let labelLeft = statusLabel.leftAnchor.constraint(equalTo: labelsStackView.leftAnchor)
        let labelRight = statusLabel.rightAnchor.constraint(equalTo: labelsStackView.rightAnchor, constant: -5)
        let labelHeight = statusLabel.heightAnchor.constraint(equalToConstant: 50)
        
        let statusButtonLeftConstraint = statusButton.leftAnchor.constraint(equalTo: self.alphaForTableView.leftAnchor, constant: 16)
        let statusButtonRightConstraint = statusButton.rightAnchor.constraint(equalTo: self.alphaForTableView.rightAnchor, constant: -16)
        let statusButtonTop = statusButton.topAnchor.constraint(equalTo: self.labelsStackView.bottomAnchor, constant: 20)
        let statusButtonHeight = statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        let textFieldRight = textField.rightAnchor.constraint(equalTo: labelsStackView.rightAnchor, constant: -15)
        let textFieldLeft = self.textField.leftAnchor.constraint(equalTo: labelsStackView.leftAnchor)
        let textFieldTop = self.textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 40)
        let textFieldHeight = self.textField.heightAnchor.constraint(equalToConstant: 40)
        
        
        
        let topExitbutton = self.exitButton.topAnchor.constraint(equalTo: self.alphaForTableView.topAnchor, constant: 25)
        let rightExitButton = self.exitButton.rightAnchor.constraint(equalTo: self.alphaForTableView.rightAnchor, constant: -25)
        let wightExitButton = self.exitButton.widthAnchor.constraint(equalToConstant: 25)
        let heightExitButton  = self.exitButton.heightAnchor.constraint(equalToConstant: 25)
        
        let avatarTop = imageview.widthAnchor.constraint(equalToConstant: 80)
        let avatarHeight = imageview.heightAnchor.constraint(equalToConstant: 80)
        
        
        let tableViewTopConstraint = self.tableView.topAnchor.constraint(equalTo: self.alphaForTableView.bottomAnchor)
        let tableViewLeadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let tableViewTrailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let tableViewBottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.changeTitleButton.topAnchor)
        
        let changeButtonHeightConstraint = self.changeTitleButton.heightAnchor.constraint(equalToConstant: 50)
        let changeButtonLeadingConstraint = self.changeTitleButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let changeButtonTrailingConstraint = self.changeTitleButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let changeButtonBottomConstraint = self.changeTitleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        
        NSLayoutConstraint.activate([
            
            tableViewTopConstraint, tableViewLeadingConstraint, tableViewTrailingConstraint, tableViewBottomConstraint, changeButtonBottomConstraint, changeButtonHeightConstraint, changeButtonLeadingConstraint, changeButtonTrailingConstraint,
            alphaTop, alphaBottomConstraint, alphsLeading, alphaTrailing,
            topExitbutton, rightExitButton, wightExitButton, heightExitButton,
            avatarTop, avatarHeight, self.imageViewTopConstraint, self.imageViewLeftConstraint,
            statusButtonTop, statusButtonHeight, statusButtonLeftConstraint, statusButtonRightConstraint,
            textFieldTop, textFieldLeft, textFieldRight, textFieldHeight, labelStackTopConstraint, labelStackLeftConstraint, labelStackRightConstraint, labelStackBottomConstraint,
            labelTop, labelLeft, labelRight, labelHeight
        ].compactMap({ $0 }))
        
    }
    
    
    @objc private func printProfileState()
    {
        self.statusLabel.text = profile.status
        self.statusLabel.setNeedsDisplay()
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
    
    private func setupGesture() {
        self.tap.addTarget(self, action: #selector(self.handleTap(_ :)))
        self.imageview.addGestureRecognizer(self.tap)
        
        print("tap")
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let tapLocation = gesture.location(in: imageview.superview)
        if (imageview.layer.presentation()?.frame.contains(tapLocation))! {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut , .beginFromCurrentState], animations: {
                self.alphaForTableView.alpha = 0.5
                self.imageViewTopConstraint?.isActive = false
                self.imageViewLeftConstraint?.isActive = false
                self.alphaBottomConstraint?.isActive = false
                self.imageViewTopConstraint = self.imageview.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
                self.imageViewLeftConstraint = self.imageview.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
                self.alphaBottomConstraint = self.alphaForTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
                NSLayoutConstraint.activate([
                    self.imageViewLeftConstraint, self.imageViewTopConstraint, self.alphaBottomConstraint
                ].compactMap({ $0 }))
                let screen = UIScreen.main.bounds
                let screenWidth = screen.size.width / 80
                self.imageview.transform = CGAffineTransform(scaleX: screenWidth, y: screenWidth)
                UIView.animate(withDuration: 0.3, delay: 0.5) {
                    self.exitButton.alpha = 1
                }
            })
        } else {
            print("not tapped!")
        }
    }
    
    @objc private func exitAnimationAvatar(sender: UIButton!) {
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.exitButton.alpha = 0
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut , .beginFromCurrentState], animations: {
            self.imageViewTopConstraint?.isActive = false
            self.imageViewLeftConstraint?.isActive = false
            self.alphaBottomConstraint?.isActive = false
            self.imageViewTopConstraint = self.imageview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
            self.imageViewLeftConstraint = self.imageview.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 16)
            self.alphaBottomConstraint = self.alphaForTableView.heightAnchor.constraint(equalToConstant: 220)
            NSLayoutConstraint.activate([
                self.imageViewLeftConstraint, self.imageViewTopConstraint, self.alphaBottomConstraint
            ].compactMap({ $0 }))
            self.exitButton.alpha = 0
            self.alphaForTableView.alpha = 1
            self.imageview.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
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

