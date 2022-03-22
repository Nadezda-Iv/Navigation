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
    
    var profile: ProfileInfo = {
        return ProfileInfo(userName: "Joke", status: "some state", imageName: "avatar")
    }()
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
       profileHeaderView.statusButton.addTarget(self, action: #selector(printProfileState), for: .touchUpInside)
        profileHeaderView.textField.addTarget(self, action: #selector(changeProfileState), for: .editingChanged)
        profileHeaderView.changeTitleButton.addTarget(self, action: #selector(changingTitle), for: .touchUpInside)
        view.addSubview(profileHeaderView)
        self.profileHeaderView = profileHeaderView
    }
    
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.backgroundColor = .white
        
        self.view.addSubview(self.profileHeaderView)
        
        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        self.heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 270)
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint
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
    
}
