//
//  LogInViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 11.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    
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
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(loginView)
        self.view.addSubview(self.loginView)
        
        let topConstraint = self.loginView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.loginView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.loginView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let bottomConstraints = self.loginView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        let scrollTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let scrollRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraints, scrollTopConstraint, scrollLeftConstraint, scrollRightConstraint, scrollBottomConstraint
        ].compactMap({ $0 }))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let postViewController  = ProfileViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
}
