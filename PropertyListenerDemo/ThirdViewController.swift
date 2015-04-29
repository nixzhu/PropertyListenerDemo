//
//  ThirdViewController.swift
//  PropertyListenerDemo
//
//  Created by NIX on 15/4/29.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Third"

        UserInfo.bindAndFireNameListener("ThirdViewController.nameButton") { name in
            self.nameButton.setTitle(name, forState: .Normal)
        }
    }

    @IBAction func changeName(sender: UIButton) {

        let alertController = UIAlertController(title: "Change name", message: nil, preferredStyle: .Alert)

        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = self.nameButton.titleLabel?.text
        }

        let action: UIAlertAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
            if let textField = alertController.textFields?.first as? UITextField {
                UserInfo.sharedInstance.name = textField.text
            }
        }
        alertController.addAction(action)

        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

