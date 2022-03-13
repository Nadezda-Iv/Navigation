//
//  LogInViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 11.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var loginView: LogInView = {
        let view = LogInView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var profile: ProfileInfo = {
        return ProfileInfo(userName: "", status: "", imageName: "logo")
    }()
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
        view.addSubview(loginView)
        self.loginView = loginView
    }
    
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        loginView.statusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    private func setupView() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white
        
        self.view.addSubview(self.loginView)
        
        let topConstraint = self.loginView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.loginView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.loginView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let bottomConstraints = self.loginView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraints
        ].compactMap({ $0 }))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let postViewController  = ProfileViewController()
        //postViewController.textTitle.title = post.title
        navigationController?.pushViewController(postViewController, animated: true)
        navigationController?.navigationBar.isHidden = true
        //self.navigationController?.pushViewController(pr, animated: true)
        //self.navigationItem.backButtonTitle = "Back"
    }
}


/*
class LogInViewController: UIViewController {

    
    private lazy var loginView: LogInView = {
        let view = LogInView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
        setupView()
    }
    
    private var heightConstraint: NSLayoutConstraint?
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.backgroundColor = .white
        
        self.view.addSubview(self.loginView)
        
        let topConstraint = self.loginView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.loginView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.loginView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.loginView.heightAnchor.constraint(equalToConstant: 270)
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint
        ].compactMap({ $0 }))
    }


}
*/
