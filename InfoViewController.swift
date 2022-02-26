//
//  InfoViewController.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 23.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "InfoViewController"
        
        let alertButton = UIButton(frame: CGRect(x: 75, y: 350, width: 200, height: 50))
        alertButton.setTitle("Alert", for: .normal)
        alertButton.backgroundColor = .systemGray
        alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        
        self.view.addSubview(alertButton)
    }
    
    
    
    
    @objc func alertAction(sender: UIButton!) {
        
        let alert = UIAlertController(title: "Click on the button", message: "Click here.", preferredStyle: .alert)
        
        let buttonActionYes = UIAlertAction(title: "Yes",
                                            style: .default,
                                            handler: {(action:UIAlertAction!) in
            print("you pressed the button")
        })
        
        let buttonActionNo = UIAlertAction(title: "No", style: .cancel) { (action:UIAlertAction!) in
            print("did you press the button after all")
        }
        
        alert.addAction(buttonActionYes)
        alert.addAction(buttonActionNo)
        
        self.present(alert, animated: true)
    }
    
    
}
