//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 24.02.2022.
//

import UIKit


protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
}

class ProfileHeaderView: UIView {

    
    private lazy var imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.backgroundColor = .systemRed
       
        imageView.layer.borderWidth = 3
        imageView.frame.size = CGSize(width: 100, height: 100)
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.height/2
    
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joker"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Smile"
        label.font = UIFont.systemFont(ofSize: 14.0)
        
        label.textColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var textField: UITextField = {
        let textField = UITextField()
        textField.isHidden = false
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        return textField
    }()
    
     lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)

       // button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
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
    
    private var buttonTopConstraint: NSLayoutConstraint?
    private var textFieldConstraint: NSLayoutConstraint?
    
    weak var delegate: ProfileHeaderViewProtocol?
    
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
        

        
        NSLayoutConstraint.activate([
            
            imageview.widthAnchor.constraint(equalToConstant: 100),
            imageview.heightAnchor.constraint(equalToConstant: 100),
            imageview.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            imageview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            
            nameLabel.leftAnchor.constraint(equalTo: imageview.rightAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            nameLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            
            statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            textField.leftAnchor.constraint(equalTo: imageview.rightAnchor, constant: 20),
            textField.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -12),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leftAnchor.constraint(equalTo: imageview.rightAnchor, constant: 20),
            statusLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -12),
            statusLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16)
        
        ].compactMap({ $0 }))
    }
    
}
