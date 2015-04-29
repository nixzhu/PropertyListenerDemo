//
//  SecondViewController.swift
//  PropertyListenerDemo
//
//  Created by NIX on 15/4/29.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Second"

        UserInfo.name.bindAndFireListener("SecondViewController.nameButton") { name in
            self.nameButton.setTitle(name, forState: .Normal)
        }

        UserInfo.hairColor.bindAndFireListener("SecondViewController.backgroundColor") { color in
            self.view.backgroundColor = color
        }
    }
}
