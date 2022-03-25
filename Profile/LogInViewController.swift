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
    
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.hideKeyboard()
        
    }
    
    
    private var bottomConstraint: NSLayoutConstraint?
    
    
    private func setupView() {
        self.view.backgroundColor = .systemGray4
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(loginView)
        self.loginView.statusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    
    
        let scrollTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let scrollLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let scrollRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        let contentWithScrollViewTopConstraint = self.loginView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentWithScrollViewHeightConstraint = self.loginView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        let contentViewCenterXConstraint = self.loginView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let contentViewWidthConstraint = self.loginView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        let bottomConstraint = self.loginView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        
        
        NSLayoutConstraint.activate([
            contentWithScrollViewTopConstraint,contentWithScrollViewHeightConstraint, contentViewCenterXConstraint, contentViewWidthConstraint, bottomConstraint, scrollTopConstraint, scrollLeftConstraint, scrollRightConstraint, scrollBottomConstraint
        ].compactMap({ $0 }))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let postViewController  = ProfileViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -300
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
}


extension LogInViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(LogInViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
