//
//  SceneDelegate.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 28.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let mainVC = PersonViewController()
        
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
    }
}

