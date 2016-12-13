//
//  Notifier.swift
//  ios-NotificationCenter-Protocol
//
//  Created by Eiji Kushida on 2016/12/13.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol Notifier {
    associatedtype Notification: RawRepresentable
}

extension Notifier where Notification.RawValue == String {

    fileprivate static func nameFor(notification: Notification) -> String {
        return "\(notification.rawValue)"
    }

    static func addObserver(observer: AnyObject,
                            selector: Selector,
                            notification: Notification) {
        let name = nameFor(notification: notification)

        NotificationCenter.default.addObserver(observer,
                         selector: selector,
                         name: NSNotification.Name(rawValue: name),
                         object: nil)
    }

    static func postNotification(notification: Notification,
                                 object: AnyObject? = nil,
                                 userInfo: [String : AnyObject]? = nil) {

        let name = nameFor(notification: notification)

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: name),
                                        object: object,
                                        userInfo: userInfo)
    }

    static func removeObserver(observer: AnyObject,
                               notification: Notification,
                               object: AnyObject? = nil) {

        let name = nameFor(notification: notification)

        NotificationCenter.default.removeObserver(observer,
                            name: NSNotification.Name(rawValue: name),
                            object: object)
    }
}
