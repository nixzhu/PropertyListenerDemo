//
//  UserInfo.swift
//  PropertyListenerDemo
//
//  Created by NIX on 15/4/29.
//  Copyright (c) 2015年 nixWork. All rights reserved.
//

import UIKit

struct Listener<T>: Hashable {
    let name: String

    typealias Action = T -> Void
    let action: Action

    var hashValue: Int {
        return name.hashValue
    }
}

func ==<T>(lhs: Listener<T>, rhs: Listener<T>) -> Bool {
    return lhs.name == rhs.name
}

class Listenable<T> {
    var value: T {
        didSet {
            for listener in listenerSet {
                listener.action(value)
            }
        }
    }

    var listenerSet = Set<Listener<T>>()

    func bindListener(name: String, action: Listener<T>.Action) {
        let listener = Listener(name: name, action: action)

        listenerSet.insert(listener)
    }

    func bindAndFireListener(name: String, action: Listener<T>.Action) {
        bindListener(name, action: action)

        action(value)
    }

    init(_ v: T) {
        value = v
    }
}

class UserInfo {

    static var name = Listenable<String>("NIX")

    static var hairColor = Listenable<UIColor>(UIColor.redColor())
}