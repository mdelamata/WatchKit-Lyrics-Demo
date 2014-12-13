//
//  AppDelegate.swift
//  instalyrics
//
//  Created by Manuel de la Mata on 20/11/2014.
//  Copyright (c) 2014 MMS. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

    func application(application: UIApplication!, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]!, reply: (([NSObject : AnyObject]!) -> Void)!) {
        
        var controller : MainViewController = self.window?.rootViewController as MainViewController;
        
        if let command: WatchKitCommand = WatchKitCommand(rawValue: userInfo["command"] as String) {
            controller.handleWatchKitNotification(command, reply)
        }        
    }
}

