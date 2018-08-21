//
//  ViewController.swift
//  Notification Local
//
//  Created by Teodik Abrami on 8/10/18.
//  Copyright © 2018 Teodik Abrami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Notification.prepareNotification(userInfo: ["phone":"09123314233"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

