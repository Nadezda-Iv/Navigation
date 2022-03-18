//
//  PostViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 22.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var textTitle = Post(title: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = textTitle.title
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(buttonAction))
        self.navigationItem.rightBarButtonItem = doneItem
    }
    
    
    
    @objc func buttonAction(sender: UIBarButtonItem!) {
        
        let infoViewController  = InfoViewController()
        
        self.navigationController?.pushViewController(infoViewController, animated: true)
        self.navigationItem.backButtonTitle = "Back"
    }
    
}
