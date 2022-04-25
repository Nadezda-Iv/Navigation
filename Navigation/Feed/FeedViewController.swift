//
//  FeedViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 22.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
   // var post = Post(title: "Лента")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "FeedViewController"
        self.view.backgroundColor = .systemMint
        
        let feedButtonSteck = UIStackView()
        feedButtonSteck.axis = .vertical
        feedButtonSteck.distribution = .fillEqually
        feedButtonSteck.spacing = 10
        feedButtonSteck.translatesAutoresizingMaskIntoConstraints = false
        feedButtonSteck.backgroundColor = .lightGray
        
        let feedOneButton = UIButton()
        feedOneButton.backgroundColor = .systemBlue
        feedOneButton.setTitle("One", for: .normal)
        
        let feedTwoButton = UIButton()
        feedTwoButton.backgroundColor = .green
        feedTwoButton.setTitle("Two", for: .normal)
        
        
        feedOneButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        feedTwoButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        feedButtonSteck.addArrangedSubview(feedOneButton)
        feedButtonSteck.addArrangedSubview(feedTwoButton)
        
        self.view.addSubview(feedButtonSteck)

        let heightConstraint = feedButtonSteck.heightAnchor.constraint(equalToConstant: 220)
        let centerXConstraint = feedButtonSteck.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        let centerYConstraint = feedButtonSteck.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        let widthButtonStack = feedButtonSteck.widthAnchor.constraint(equalToConstant: 250)
        
        NSLayoutConstraint.activate([
            centerXConstraint, centerYConstraint, heightConstraint, widthButtonStack
     
        ].compactMap({ $0 }))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let postViewController  = PostViewController()
        //postViewController.textTitle.title = post.title
        self.navigationController?.pushViewController(postViewController, animated: false)
        self.navigationItem.backButtonTitle = "Back"
    }
}
