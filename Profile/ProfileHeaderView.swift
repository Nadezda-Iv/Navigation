//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 24.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    
    
    fileprivate let NavBarPadding = 91;
    var profile: ProfileInfo
    
    var nameLabel: UILabel = {
        let nameProfile = UILabel()
        nameProfile.textColor = .gray
        return nameProfile
    }()
    
    
    let statusTextField : UITextField = {
        let sampleTextField = UITextField()
        sampleTextField.placeholder = "Enter status"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        sampleTextField.leftView = paddingView
        sampleTextField.leftViewMode = .always
        sampleTextField.layer.cornerRadius = 12
        /*
         let stateTextField = UITextField()
         stateTextField.backgroundColor = .white
         stateTextField.layer.cornerRadius = 12
         stateTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
         stateTextField.textColor = .black
         stateTextField.layer.borderColor = UIColor.black.cgColor
         stateTextField.layer.borderWidth = 1
         
         let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
         stateTextField.leftView = paddingView
         stateTextField.leftViewMode = .always
         */
        
        return sampleTextField
    } ()
    
    
    let statusButton: UIButton = {
       let showButton = UIButton()
        showButton.setTitleColor(.white, for: .normal)
        showButton.layer.cornerRadius = 4
        showButton.setTitle("Set status", for: .normal)
        showButton.layer.shadowOpacity = 0.7
        showButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showButton.layer.shadowColor = UIColor.black.cgColor
        showButton.layer.shadowRadius = CGFloat(4)
        showButton.backgroundColor = UIColor(red: CGFloat(0.0/0.0), green: CGFloat(122.0/255.0), blue: CGFloat(254.0/255.0), alpha: CGFloat(1.0))
        
        return showButton
    }()

    var profileStateLabel: UILabel = {
        let profileStateLabel = UILabel()
        profileStateLabel.textColor = .gray
        
        return profileStateLabel
    }()
    
    

    
    
    
    public init(profile: ProfileInfo, frame: CGRect) {
        self.profile = profile
        super.init(frame: frame)
        print("Profile: \(self.profile.userName), \(self.profile.status), \(self.profile.imageName)")
        let image = UIImage(named: profile.imageName)
        let profileImage = UIImageView()
        profileImage.image = image
        let imageSize = 100
        profileImage.frame = CGRect(origin: CGPoint(x: 16, y: NavBarPadding + 16), size: CGSize(width: imageSize, height: imageSize))
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        addSubview(profileImage)

        let textWidth = frame.width - profileImage.frame.maxX - 32
        
        
        let profileTitle = UILabel()
        let profileTitleFontSize = 18
        profileTitle.frame = CGRect(origin: CGPoint(x: Int(profileImage.frame.maxX) + 16, y: NavBarPadding + 27), size: CGSize(width: Int(textWidth), height: profileTitleFontSize))
        profileTitle.font = UIFont.systemFont(ofSize: CGFloat(profileTitleFontSize), weight: .bold)
        profileTitle.textColor = .black
        profileTitle.text = profile.userName
        addSubview(profileTitle)
        
        let profileTextFieldFontSize = 14
        profileStateLabel.frame = CGRect(origin: CGPoint(x: Int(profileImage.frame.maxX) + 16, y: Int(profileImage.frame.maxY) - (18 + profileTextFieldFontSize)), size: CGSize(width: Int(textWidth), height: profileTextFieldFontSize))
        profileStateLabel.font = UIFont.systemFont(ofSize: CGFloat(profileTextFieldFontSize), weight: .regular)
        profileStateLabel.text = profile.status
        addSubview(profileStateLabel)
        
        statusTextField.frame = CGRect(origin: CGPoint(x: Int(profileImage.frame.maxX) + 16, y: Int(profileStateLabel.frame.maxY) + 16), size: CGSize(width: Int(textWidth), height: 40))
        addSubview(statusTextField)
        
        statusButton.frame = CGRect(origin: CGPoint(x: 16, y: Int(statusTextField.frame.maxY) + 16), size: CGSize(width: frame.width - 32, height: 50))
        addSubview(statusButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
