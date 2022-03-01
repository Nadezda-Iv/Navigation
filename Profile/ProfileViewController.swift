//
//  ProfileViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 22.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderView: ProfileHeaderView?
    var profile: ProfileInfo = {
        return ProfileInfo(userName: "Ivan Ivanov", status: "some status", imageName: "avatar.png")
    }()
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let profileHeaderView = ProfileHeaderView(
            profile: self.profile,
            frame: view.frame
        )
        profileHeaderView.statusButton.addTarget(self, action: #selector(printProfileState), for: .touchUpInside)
        profileHeaderView.statusTextField.addTarget(self, action: #selector(changeProfileState), for: .editingChanged)
        view.addSubview(profileHeaderView)
        self.profileHeaderView = profileHeaderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.title = "Profile"
    }
    
    @objc private func printProfileState()
    {
        self.profileHeaderView?.profileStateLabel.text = profile.status
        self.profileHeaderView?.profileStateLabel.setNeedsDisplay()
    }
    
    @objc private func changeProfileState(_ textField: UITextField)
    {
        profile.status = String(textField.text ?? profile.status)
        print(profile.status)
    }

    
}
