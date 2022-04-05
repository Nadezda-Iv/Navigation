//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 24.02.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
    private var tap: UITapGestureRecognizer!
    
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 1
        return view
    }()
    
    private lazy var exitButton: UIButton = {
         let button = UIButton()
         button.layer.cornerRadius = 20
         button.alpha = 0
         button.clipsToBounds = true
         button.setBackgroundImage(UIImage(named: "img_230392"), for: .normal)
         //button.addTarget(self, action: #selector(self.didTapSetStatusButton), for: .touchUpInside)
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    

        lazy var imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.backgroundColor = .systemRed
       
        imageView.layer.borderWidth = 3
        imageView.frame.size = CGSize(width: 80, height: 80)
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.isUserInteractionEnabled = true
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
        textField.backgroundColor = .systemGray6
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
    

   // private var buttonTopConstraint: NSLayoutConstraint?
   // private var textFieldConstraint: NSLayoutConstraint?
    private var isExpanded = false
    private let screenWidth = UIScreen.main.bounds.width
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      //super.init(coder: aDecoder)
      tap = UITapGestureRecognizer(target: self, action: #selector(ProfileHeaderView.handleTap(_:)))
    }
    
    /*required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } */
    
    private func drawSelf() {
        self.addSubview(self.infoStackView)
        self.addSubview(self.statusButton)
        self.addSubview(self.textField)
        self.addSubview(alphaView)
        self.bringSubviewToFront(alphaView)
        self.alphaView.addSubview(self.exitButton)
        
        self.infoStackView.addArrangedSubview(self.imageview)
        self.infoStackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.nameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)

        NSLayoutConstraint.activate([
            alphaView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            alphaView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            alphaView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            exitButton.topAnchor.constraint(equalTo: alphaView.topAnchor, constant: 5),
            exitButton.rightAnchor.constraint(equalTo: alphaView.rightAnchor, constant: -25),
            exitButton.widthAnchor.constraint(equalToConstant: 25),
            exitButton.heightAnchor.constraint(equalToConstant: 25),

            infoStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            infoStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            infoStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            
            imageview.widthAnchor.constraint(equalToConstant: 80),
            imageview.heightAnchor.constraint(equalToConstant: 80),
            
            statusButton.leftAnchor.constraint(equalTo: infoStackView.leftAnchor),
            statusButton.rightAnchor.constraint(equalTo: infoStackView.rightAnchor),
            statusButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 14),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            textField.leftAnchor.constraint(equalTo: imageview.rightAnchor, constant: 15),
            textField.rightAnchor.constraint(equalTo: infoStackView.rightAnchor),
            textField.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 10),
            textField.heightAnchor.constraint(equalToConstant: 40)

        ].compactMap({ $0 }))
    }
    
    private func setupGesture() {
       // self.tap.addTarget(self, action: #selector(self.tapAvatarImage(_ :)))
        self.imageview.addGestureRecognizer(self.tap)
    }
    
    
    
    func moveBugLeft() {
     // if isBugDead { return }
      
      UIView.animate(withDuration: 1.0,
                     delay: 2.0,
                     options: [.curveEaseInOut , .allowUserInteraction],
                     animations: {
                      self.imageview.center = CGPoint(x: 75, y: 200)
      },
                     completion: { finished in
                      print("Bug moved left!")
                     
      })
    }
    
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
      let tapLocation = gesture.location(in: imageview.superview)
      if (imageview.layer.presentation()?.frame.contains(tapLocation))! {
        print("Bug tapped!")
        //if isBugDead { return }
        //view.removeGestureRecognizer(tap)
       // isBugDead = true
       // squishPlayer.play()
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseOut , .beginFromCurrentState], animations: {
          self.imageview.transform = CGAffineTransform(scaleX: 1.25, y: 0.75)
        }, completion: { finished in
          UIView.animate(withDuration: 2.0, delay: 2.0, options: [], animations: {
            self.imageview.alpha = 0.0
          }, completion: { finished in
            self.imageview.removeFromSuperview()
          })
        })
      } else {
        print("Bug not tapped!")
      }
    }
    
    
}
