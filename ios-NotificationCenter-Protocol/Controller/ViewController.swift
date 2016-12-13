//
//  ViewController.swift
//  ios-NotificationCenter-Protocol
//
//  Created by Eiji Kushida on 2016/12/13.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

extension Selector {
    static let photoListDidLoad = #selector(ViewController.photoListDidLoad)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        add()
    }

    func add() {
        Event.addObserver(observer: self,
                            selector: .photoListDidLoad,
                            notification: .photoListDidLoad)
    }

    func photoListDidLoad(notification: Notification) {
        print(#function)

        Event.removeObserver(observer: self,
                               notification: .photoListDidLoad)
    }
    @IBAction func PostDidTap(_ sender: UIButton) {
        post()
    }

    fileprivate func post() {
        Event.postNotification(notification: .photoListDidLoad)
    }
}

