//
//  LogInViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 11.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var regex = "^(?=.*[а-я])(?=.*[А-Я])(?=.*\\d)(?=.*[$@$!%*?&#])[А-Яа-я\\d$@$!%*?&#]{\(8),}$"
    private let password = "АБаб$123"
    
    
    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.text = "The number of characters is at least 8"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.hideKeyboard()
    }

    private func setupView() {
        self.view.backgroundColor = .systemGray4
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(loginView)
        self.loginView.statusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.scrollView.addSubview(warningLabel)
    
    
        let scrollTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let scrollLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let scrollRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        let contentWithScrollViewTopConstraint = self.loginView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentWithScrollViewHeightConstraint = self.loginView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        let contentViewCenterXConstraint = self.loginView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let contentViewWidthConstraint = self.loginView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        let bottomConstraint = self.loginView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        
        let warningLabelTopConstraint = self.warningLabel.topAnchor.constraint(equalTo: self.loginView.statusButton.bottomAnchor, constant: 2)
        let warningLabelLeftConstraint = self.warningLabel.leftAnchor.constraint(equalTo: self.loginView.leftAnchor, constant: 15)
        let warningLabelRightConstraint = self.warningLabel.rightAnchor.constraint(equalTo: self.loginView.rightAnchor, constant: -15)
        let warningLabelHeightConstraint = self.warningLabel.heightAnchor.constraint(equalToConstant: 45)
        
        
        NSLayoutConstraint.activate([
            contentWithScrollViewTopConstraint,contentWithScrollViewHeightConstraint, contentViewCenterXConstraint, contentViewWidthConstraint, bottomConstraint, scrollTopConstraint, scrollLeftConstraint, scrollRightConstraint, scrollBottomConstraint,
            warningLabelTopConstraint, warningLabelLeftConstraint, warningLabelRightConstraint, warningLabelHeightConstraint
        ].compactMap({ $0 }))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let postViewController  = ProfileViewController()
        if loginView.loginTextField.text!.isEmpty || loginView.passwordTextField.text!.isEmpty {
            if loginView.loginTextField.text!.isEmpty {
                loginView.loginTextField.backgroundColor = .red
                loginView.loginTextField.alpha = 0.2
                print("login пустой")
            } else {
                loginView.passwordTextField.backgroundColor = .red
                loginView.passwordTextField.alpha = 0.2
                print("пароль пустой")
            }
        } else {
            guard loginView.passwordTextField.text!.count >= 8 else {
                warningLabel.isHidden = false
                warningLabel.text = "Пароль содержит не менее 8 символов"
                print("<8")
                return
            }
            if loginView.passwordTextField.text!.matches(regex) {
                loginView.passwordTextField.textColor = .green
                warningLabel.isHidden = false
                warningLabel.text = "Верные символы в пароле!"
                print("yes")
                navigationController?.pushViewController(postViewController, animated: true)
                navigationController?.navigationBar.isHidden = true
            } else {
                warningLabel.isHidden = false
                warningLabel.text =  "Пароль неверный"
            print("no")
            }
                //navigationController?.pushViewController(postViewController, animated: true)
                //navigationController?.navigationBar.isHidden = true
            }
        }
    
    
    /*
     private func checkValidation(password: String) {
         guard password.count >= minLength else {
             messageLabel.text = ""
             return
         }
         
         if password.matches(regex) {
             messageLabel.textColor = .green
             messageLabel.text = "Верные символы в пароле!"
         } else {
             messageLabel.textColor = .white
             messageLabel.text = "Минимум \(minLength) символов\nДолжен содержать: \n1 большую букву,\n1 маленькую букву,\n1 цифру и\n1специальный символ"
         }
     }
     */
    
    
    
    
    func passwordVerification(password: String) -> Bool {
        if passwordUser == password {
            return true
        }
         return false
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

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
