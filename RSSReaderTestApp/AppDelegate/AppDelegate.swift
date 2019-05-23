//
//  AppDelegate.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?
    private let networkService = NetworkService()

    // MARK: - Application lifecicle methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = #colorLiteral(red: 0.9643666148, green: 0.9724945426, blue: 0.9806874394, alpha: 1)
        window?.makeKeyAndVisible()
        
        let newsFeedViewModel = NewsFeedVM(networkService: networkService)
        let newsFeedVC = NewsFeedVC(viewModel: newsFeedViewModel)
        
        window?.rootViewController = UINavigationController(rootViewController: newsFeedVC)
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }

}

