//
//  FileBag.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 01.03.2022.
//

import Foundation

/*
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

private lazy var imageview: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemRed
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}()


//var profile: ProfileInfo

var nameLabel: UILabel = {
    let nameProfile = UILabel()
    nameProfile.textColor = .gray
    return nameProfile
}()

private lazy var labelsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}()

private lazy var infoStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 20
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}()



override init(frame: CGRect) {
    super.init(frame: frame)
    //profile: self.profile
    self.drawSelf()
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

private func drawSelf() {
    self.addSubview(self.infoStackView)
    self.addSubview(self.statusButton)
    self.addSubview(self.statusTextField)
    self.infoStackView.addArrangedSubview(self.imageview)
    self.infoStackView.addArrangedSubview(self.labelsStackView)
    self.labelsStackView.addArrangedSubview(self.nameLabel)
    self.labelsStackView.addArrangedSubview(self.profileStateLabel)

}
}


/*   var profile: ProfileInfo

private lazy var imageview: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemRed
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}()

private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .systemGreen
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

private lazy var statusLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .blue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

private lazy var textField: UITextField = {
    let textField = UITextField()
    textField.isHidden = true
    textField.backgroundColor = .systemYellow
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
}()

private lazy var statusButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .systemOrange
    button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}()

private lazy var labelsStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}()

private lazy var infoStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 20
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
}()



override init(frame: CGRect) {
    super.init(frame: frame)
    self.drawSelf()
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

private func drawSelf() {
    self.addSubview(self.infoStackView)
    self.addSubview(self.statusButton)
    self.addSubview(self.textField)
    self.infoStackView.addArrangedSubview(self.imageview)
    self.infoStackView.addArrangedSubview(self.labelsStackView)
    self.labelsStackView.addArrangedSubview(self.nameLabel)
    self.labelsStackView.addArrangedSubview(self.statusLabel)

*/



/*    fileprivate let NavBarPadding = 91;
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

*/
*/
// viewController

/*
 var profileHeaderView: ProfileHeaderView?
 var profile: ProfileInfo = {
     return ProfileInfo(userName: "Ivan Ivanov", status: "some status", imageName: "avatar.png")
 }()
 
 open override func viewWillLayoutSubviews() {
     super.viewWillLayoutSubviews()
     let profileHeaderView = ProfileHeaderView(
         //profile: self.profile,
         frame: view.frame
     )
     profileHeaderView.statusButton.addTarget(self, action: #selector(printProfileState), for: .touchUpInside)
     profileHeaderView.statusTextField.addTarget(self, action: #selector(changeProfileState), for: .editingChanged)
     view.addSubview(profileHeaderView)
     self.profileHeaderView = profileHeaderView
 }

 override func viewDidLoad() {
     super.viewDidLoad()
     view.backgroundColor = .systemMint
     //self.title = "Profile"
     
     setupNavigationBar()
 }
 
 
 private func setupNavigationBar() {
     self.navigationController?.navigationBar.prefersLargeTitles = true
     self.navigationItem.title = "Профиль23"
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
 */
