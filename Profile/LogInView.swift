//
//  LogInView.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 11.03.2022.
//

import UIKit


class LogInView: UIView {

    private lazy var imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.backgroundColor = .lightGray
       
        imageView.layer.borderWidth = 0.5
        imageView.frame.size = CGSize(width: 100, height: 100)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var loginPasswordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
     lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = false
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false
        //textField.layer.cornerRadius = 12
         textField.textColor = .black
         textField.autocapitalizationType = .none
         textField.font = .systemFont(ofSize: 16)
         textField.placeholder = "Email or phone number"
         textField.layer.borderWidth = 0.5
         textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
         textField.leftViewMode = .always
         textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = false
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = "Password"
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        //textField.layer.cornerRadius = 12
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
     lazy var statusButton: UIButton = {
        let button = UIButton()
       
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Enter", for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    let tableView = UITableView.init(frame: .zero)

    private var buttonTopConstraint: NSLayoutConstraint?
    private var textFieldConstraint: NSLayoutConstraint?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.addSubview(self.imageview)
        self.addSubview(self.statusButton)
        self.addSubview(self.loginPasswordStackView)
        self.loginPasswordStackView.addArrangedSubview(self.loginTextField)
        self.loginPasswordStackView.addArrangedSubview(self.passwordTextField)


        NSLayoutConstraint.activate([
            
            imageview.widthAnchor.constraint(equalToConstant: 100),
            imageview.heightAnchor.constraint(equalToConstant: 100),
            imageview.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            imageview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            
            loginPasswordStackView.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 120),
            loginPasswordStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            loginPasswordStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            loginPasswordStackView.heightAnchor.constraint(equalToConstant: 100),
            
            statusButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16)
            
        ].compactMap({ $0 }))
    }
}


