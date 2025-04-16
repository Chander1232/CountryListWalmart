//
//  SceneDelegate.swift
//  ListOfCountriesApp
//
//  Created by Saichander Sunkari on 12/03/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: SetupCountryListViewController())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
