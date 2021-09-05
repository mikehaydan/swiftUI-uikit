//
//  RootCoordinator.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import UIKit

final class RootCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    
    let navigationController: UINavigationController
    
    var root: UIViewController {
        return navigationController
    }
    
    init() {
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return
        }

        let controller = RootViewController(viewModel: RootViewControllerViewModel(coordinator: self))
        window.rootViewController = navigationController

        navigationController.viewControllers = [controller]
    }
    
    func showDetails(from model: Item) {
        let viewModel = DetailsViewModel(title: model.title, description: model.description, baseCoordinator: self)
        let controller = DetailsController(viewModel: viewModel)
        navigationController.show(controller, sender: nil)
    }
}
