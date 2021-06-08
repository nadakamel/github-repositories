//
//  AppWindowManager.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 08/06/2021.
//

import UIKit

enum AppWindowManager {
    static func setupWindow() {
        let window = self.window ?? UIWindow.init(frame: windowFrame)
        let controller = HomeViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}

private extension AppWindowManager {
    static var window: UIWindow? {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)?.window
        }
        set {
            (UIApplication.shared.delegate as? AppDelegate)?.window = newValue
        }
    }

    static var windowFrame: CGRect {
        return UIScreen.main.bounds
    }
}
