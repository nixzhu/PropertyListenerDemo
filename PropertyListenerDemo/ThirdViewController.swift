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

        UserInfo.name.bindAndFireListener("ThirdViewController.nameButton") { name in
            self.nameButton.setTitle(name, forState: .Normal)
        }

        UserInfo.hairColor.bindAndFireListener("ThirdViewController.backgroundColor") { color in
            self.view.backgroundColor = color
        }
    }

    @IBAction func changeName(sender: UIButton) {

        let alertController = UIAlertController(title: "Change name", message: nil, preferredStyle: .Alert)

        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = self.nameButton.titleLabel?.text
        }

        let action: UIAlertAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
            if let textField = alertController.textFields?.first as? UITextField {
                UserInfo.name.value = textField.text

                let red = CGFloat(arc4random()) % 256 / 255.0
                let green = CGFloat(arc4random()) % 256 / 255.0
                let blue = CGFloat(arc4random()) % 256 / 255.0
                UserInfo.hairColor.value = UIColor(red: red, green: green, blue: blue, alpha: 1)
            }
        }
        alertController.addAction(action)

        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

