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

        nameButton.setTitle(UserInfo.sharedInstance.name, forState: .Normal)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUI:", name: UserInfo.Notification.NameChanged, object: nil)
    }

    func updateUI(notification: NSNotification) {
        if let name = notification.object as? String {
            nameButton.setTitle(name, forState: .Normal)
        }
    }
}
