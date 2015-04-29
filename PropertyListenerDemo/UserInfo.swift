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

    typealias NameListener = (String?) -> Void

    var nameListeners = [NameListener]()

    class func bindNameListener(nameListener: NameListener) {
        self.sharedInstance.nameListeners.append(nameListener)
    }

    class func bindAndFireNameListener(nameListener: NameListener) {
        bindNameListener(nameListener)

        nameListener(self.sharedInstance.name)
    }

    var name: String = "NIX" {
        didSet {
            nameListeners.map { $0(self.name) }
        }
    }
}