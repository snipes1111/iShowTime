//
//  SceneDelegate.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 16/05/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private lazy var dataStorage: DataStoreManagerProtocol = DataStoreManger()

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let mainTabBarController = MainTabBarController()
        window.rootViewController = mainTabBarController
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        dataStorage.checkForDelete()
    }
}
