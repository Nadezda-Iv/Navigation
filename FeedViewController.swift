//
//  FeedViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 22.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Лента")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "FeedViewController"
        self.view.backgroundColor = UIColor.lightGray
        
        let postButton = UIButton(frame: CGRect(x: 75, y: 350, width: 250, height: 45))
        postButton.backgroundColor = .systemBlue
        postButton.setTitle("Post", for: .normal)
        postButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(postButton)
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        //print("Button tapped")
        let postViewController  = PostViewController()
        postViewController.textTitle.title = post.title
        self.navigationController?.pushViewController(postViewController, animated: false)
        self.navigationItem.backButtonTitle = "Back"
    }
    
    
}
