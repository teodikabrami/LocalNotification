//
//  Notification.swift
//  Notification Local
//
//  Created by Teodik Abrami on 8/10/18.
//  Copyright © 2018 Teodik Abrami. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class Notification {
    
    static func prepareNotification(userInfo: [String: Any]) {
        
        
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "body"
        content.sound = UNNotificationSound.default()
        // user info

        content.userInfo = userInfo
        // add image
        
        let tempdurl = URL.init(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        let tempurl = tempdurl.appendingPathComponent("temp.png")
        if let image = UIImage(named: "1") {
            try? UIImagePNGRepresentation(image)?.write(to: tempurl)
            if let tempimage = try? UNNotificationAttachment(identifier: "attach", url: tempurl, options: nil) {
                content.attachments = [tempimage]
            }
        }
        
        // add button
        let cancelAction = UNNotificationAction(identifier: "notify.cancel", title: "cancel", options: [])
        let doneAction = UNNotificationAction(identifier: "notify.done", title: "done", options: [])
        let category = UNNotificationCategory(identifier: "category", actions: [cancelAction,doneAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "asd", options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        content.categoryIdentifier = "category"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("show")
    }
    
    
    
    
    
    
    static func prepareRepeatNotification() {
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.subtitle = "subtitle"
        content.body = "body"
        content.sound = UNNotificationSound.default()
        // add image
        let tempdurl = URL.init(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        let tempurl = tempdurl.appendingPathComponent("temp.png")
        if let image = UIImage(named: "1") {
            try? UIImagePNGRepresentation(image)?.write(to: tempurl)
            if let tempimage = try? UNNotificationAttachment(identifier: "attach", url: tempurl, options: nil) {
                content.attachments = [tempimage]
            }
        }
        // add button
        let cancelAction = UNNotificationAction(identifier: "notify.cancel", title: "cancel", options: [])
        let doneAction = UNNotificationAction(identifier: "notify.done", title: "done", options: [])
        let category = UNNotificationCategory(identifier: "category", actions: [cancelAction,doneAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "asd", options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        content.categoryIdentifier = "category"
        let calender = Calendar(identifier: .persian)
        let component = DateComponents(calendar: calender,day : 3)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: true)
        let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("show")
    }
    

    
}
