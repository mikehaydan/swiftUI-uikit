//
//  DetailsViewModel.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import UIKit
import Components

final class DetailsViewModel: BaseViewModel {
    
    var baseCoordinator: Coordinator {
        return coordinator
    }
    
    let title: String
    let description: String
    
    private let coordinator: RootCoordinator

    init(title: String, description: String, baseCoordinator: RootCoordinator) {
        self.title = title
        self.description = description
        self.coordinator = baseCoordinator
    }
    
    func setup() {
        
    }
}
