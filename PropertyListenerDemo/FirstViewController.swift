//
//  FirstViewController.swift
//  PropertyListenerDemo
//
//  Created by NIX on 15/4/29.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "First"

        UserInfo.name.bindAndFireListener("FirstViewController.nameButton") { name in
            self.nameButton.setTitle(name, forState: .Normal)
        }

        UserInfo.hairColor.bindAndFireListener("FirstViewController.backgroundColor") { color in
            self.view.backgroundColor = color
        }
    }
}
