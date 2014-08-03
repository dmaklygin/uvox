//
//  UserSettings.swift
//  uvox
//
//  Created by Дмитрий on 03.08.14.
//  Copyright (c) 2014 Ruslan Syubaev. All rights reserved.
//

import Foundation

let UserSettingsLoginChanged = "UserSettingsLoginChanged"

class UserSettings: NSObject {
    
    lazy var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    class var sharedInstance: UserSettings {
        struct Static {
            static let instance: UserSettings = UserSettings()
        }
        return Static.instance
    }
    
    var userId: AnyObject? {
    get {
        return self.userDefaults.objectForKey("userId")
    }
    set {
        self.userDefaults.setObject(newValue, forKey: "userId")
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: UserSettingsLoginChanged, object: self))
    }
    }
}