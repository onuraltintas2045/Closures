//
//  SceneDelegate.swift
//  Closures
//
//  Created by Onur Altintas on 12.05.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .light
        window.rootViewController = ClosuresViewController()
        self.window = window
    }



}

