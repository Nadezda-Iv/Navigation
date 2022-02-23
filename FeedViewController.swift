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
        
        //var tabBarItem = UITabBarItem()
        //tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.view.backgroundColor = UIColor.green
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
