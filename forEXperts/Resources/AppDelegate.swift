//
//  AppDelegate.swift
//  forEXperts
//
//  Created by Daniel Alfonso on 7/16/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var users:[Person] = []
    var userFirstName = ""
    var userLastName = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let Daniel = Person(firstName: "Daniel",
                            lastName: "Alfonso",
                            loginName: "Dalfonso",
                            password: "6096463")
        
        let Simon = Person(firstName: "Simon",
                           lastName: "Bruce",
                           loginName: "Sbruce",
                           password: "6247755")
        
        
        users.append(Daniel);
        users.append(Simon);
        
        
        APICaller.shared.getAllIcons()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

