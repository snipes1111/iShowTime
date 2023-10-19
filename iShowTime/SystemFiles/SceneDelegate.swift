//
//  SceneDelegate.swift
//  iShowTime
//
//  Created by user on 16/05/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let builder = Builder()
        let mainTabBarController = builder.buildMainTabController()
        window.rootViewController = mainTabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}
