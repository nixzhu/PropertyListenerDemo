//
//  UserInfo.swift
//  PropertyListenerDemo
//
//  Created by NIX on 15/4/29.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import Foundation

func ==(lhs: UserInfo.NameListener, rhs: UserInfo.NameListener) -> Bool {
    return lhs.name == rhs.name
}

class UserInfo {

    static let sharedInstance = UserInfo()

    struct NameListener: Hashable {
        let name: String

        typealias Action = String -> Void
        let action: Action

        var hashValue: Int {
            return name.hashValue
        }
    }

    var nameListenerSet = Set<NameListener>()

    class func bindNameListener(name: String, action: NameListener.Action) {
        let nameListener = NameListener(name: name, action: action)

        self.sharedInstance.nameListenerSet.insert(nameListener)
    }

    class func bindAndFireNameListener(name: String, action: NameListener.Action) {
        bindNameListener(name, action: action)

        action(self.sharedInstance.name)
    }

    var name: String = "NIX" {
        didSet {
            for nameListener in nameListenerSet {
                nameListener.action(name)
            }
        }
    }
}