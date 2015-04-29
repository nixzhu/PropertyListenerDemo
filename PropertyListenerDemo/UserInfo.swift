//
//  UserInfo.swift
//  PropertyListenerDemo
//
//  Created by NIX on 15/4/29.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import Foundation

class UserInfo {

    static let sharedInstance = UserInfo()

    struct Notification {
        static let NameChanged = "UserInfo.Notification.NameChanged"
    }

    var name: String = "NIX" {
        didSet {
            NSNotificationCenter.defaultCenter().postNotificationName(Notification.NameChanged, object: name)
        }
    }
}