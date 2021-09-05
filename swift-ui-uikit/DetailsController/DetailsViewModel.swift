//
//  DetailsViewModel.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import UIKit
import SwiftUI

final class DetailsViewModel: BaseViewModel, ObservableObject {

    let title: String
    let description: String

    unowned let coordinator: RootCoordinator

    init(title: String, description: String, baseCoordinator: RootCoordinator) {
        self.title = title
        self.description = description
        self.coordinator = baseCoordinator
    }

    func setup() {
        print("Setting up `DetailsViewModel`...")
    }
}
