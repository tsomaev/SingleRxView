//
//  AppDelegate.swift
//  SingleView
//
//  Created by Soslan-Bek Tsomaev on 18.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootController = ViewController()
        let viewModel = MainViewModel()
        rootController.viewModel = viewModel
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootController
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
                
        return true
    }
}
