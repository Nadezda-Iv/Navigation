//
//  ProfileViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 22.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileEx = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ProfileViewController"
        self.view.backgroundColor = .lightGray
        
        self.tabBarItem.badgeColor = .gray
        
    }
        
        
    override func viewWillLayoutSubviews() {
                NSLog("profileEx size: w:\(self.view.bounds.size.width), h: \(self.view.bounds.size.height)")
            }
    
    
    
}
