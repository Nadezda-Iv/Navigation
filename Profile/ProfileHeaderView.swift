//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 24.02.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
    
    
     var isTap: Bool?
    
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 1
        return view
    }()
    
    private lazy var betaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0
        return view
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
        textField.backgroundColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        return textField
    }()
    
     lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Set status", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
      
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func drawSelf() {
        //self.addSubview(self.infoStackView)
        self.addSubview(self.statusButton)
        self.addSubview(self.textField)
        self.addSubview(self.infoStackView)
        //self.addSubview(alphaView)
        //self.addSubview(betaView)
        //self.bringSubviewToFront(alphaView)
        //self.betaView.addSubview(self.infoStackView)
        //self.alphaView.addSubview(self.exitButton)
        //self.alphaView.addSubview(self.imageview)
       
        self.infoStackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.nameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)

        
        //self.imageViewTopConstraint = imageview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
       // self.imageViewLeftConstraint = imageview.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
   

            infoStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            infoStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 150),
            infoStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),

            
            statusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: infoStackView.rightAnchor),
            statusButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 14),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            textField.leftAnchor.constraint(equalTo: infoStackView.rightAnchor, constant: 15),
            textField.rightAnchor.constraint(equalTo: infoStackView.rightAnchor),
            textField.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 10),
            textField.heightAnchor.constraint(equalToConstant: 40)

        ].compactMap({ $0 }))
    }
    
  
    
    
}
