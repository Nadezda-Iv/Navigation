//
//  ProfileViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 22.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
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
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
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
        self.fetchArticles { [weak self] articles in
            self?.dataSource = articles
            self?.tableView.reloadData()
        }
    }

    private func setupView() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.addSubview(self.changeTitleButton)
        
        self.view.addSubview(self.tableView)
        self.tableView.backgroundColor = .red
        
        self.view.addSubview(self.profileHeaderView)
        
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        let tableViewTopConstraint = self.tableView.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor)
        let tableViewLeadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let tableViewTrailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let tableViewBottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.changeTitleButton.topAnchor)
        
        let changeButtonHeightConstraint = self.changeTitleButton.heightAnchor.constraint(equalToConstant: 50)
        let changeButtonLeadingConstraint = self.changeTitleButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let changeButtonTrailingConstraint = self.changeTitleButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let changeButtonBottomConstraint = self.changeTitleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint, tableViewTopConstraint, tableViewLeadingConstraint, tableViewTrailingConstraint, tableViewBottomConstraint, changeButtonBottomConstraint, changeButtonHeightConstraint, changeButtonLeadingConstraint, changeButtonTrailingConstraint
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
    
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let article = self.dataSource[indexPath.row]
        let viewModel = PostTableViewCell.Post(author: article.author, description: article.description, image: article.image, likes: Int(article.likes) ?? 0, views: Int(article.views) ?? 0)
        cell.setup(with: viewModel)
        return cell
    }
}
