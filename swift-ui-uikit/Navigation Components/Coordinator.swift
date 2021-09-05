//
//  Coordinator.swift
//
//
//  Created by Mike on 30/03/2021.
//

import UIKit

/// `Coordinator` protocol for `UIKit` navigation in `MVVM+C` architecture
public protocol Coordinator: AnyObject {
    /**
        Child coordinators of the current `Coordinator`.

        Example: TabBarCoordinator, where each tab represents a child
     */
    var childCoordinators: [Coordinator] { get set }
    /**
        Parent coordinators of the current `Coordinator`.

        Example: Tab of a TabBarCoordinator.

        **Note:** Parent has to be `weak` or `unowned`
     */
    var parentCoordinator: Coordinator? { get set }
    /**
        Root controller of the navigation

        `root` can be `UITabBarController` or `UINavigationController`
     */
    var root: UIViewController { get }
}
