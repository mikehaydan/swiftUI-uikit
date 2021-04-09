//
//  BaseViewModel.swift
//  
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

public protocol BaseViewModel: ObservableObject {
    
    var baseCoordinator: Coordinator { get }
    
    func setup()
}

extension BaseViewModel {
    func setup() {
        
    }
}
