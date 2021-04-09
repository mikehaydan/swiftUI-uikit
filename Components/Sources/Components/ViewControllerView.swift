//
//  ViewControllerView.swift
//  
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

public protocol ViewControllerView {
    associatedtype VM: BaseViewModel
    
    init(viewModel: StateObject<VM>)
}
