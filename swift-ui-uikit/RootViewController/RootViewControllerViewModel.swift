//
//  RootViewControllerViewModel.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

final class RootViewControllerViewModel: BaseViewModel, ObservableObject {

    @Published var dataSource: [Item] = []

    unowned let coordinator: RootCoordinator

    init(coordinator: RootCoordinator) {
        self.coordinator = coordinator
    }

    func showDetails(model: Item) {
        coordinator.showDetails(from: model)
    }

    func setup() {
        print("Setting up `RootViewControllerViewModel`...")
        dataSource = Item.exampleDataSource
    }

    func remove(item: Item) {
        dataSource.removeAll(where: { $0.id == item.id })
    }
}
