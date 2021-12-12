//
//  SceneDelegate.swift
//  Nomad Clone App
//
//  Created by Paolo Prodossimo Lopes on 10/12/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene_ = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene_)
        window?.rootViewController = Orchestrator () //chamado dps do layout
        window?.makeKeyAndVisible() // para as coisas aparecerem 
    }

    func sceneDidDisconnect(_ scene: UIScene) {
  }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

