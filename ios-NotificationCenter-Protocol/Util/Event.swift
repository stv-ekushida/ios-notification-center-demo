//
//  Event.swift
//  ios-NotificationCenter-Protocol
//
//  Created by Eiji Kushida on 2016/12/13.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import Foundation

final class Event: Notifier {

    enum Notification: String {
        case photoListDidLoad
        case photoDetailDidLoad
    }
}
