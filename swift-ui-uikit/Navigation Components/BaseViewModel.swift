//
//  BaseViewModel.swift
//
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

/// `ViewModel` protocol for `UIKit` navigation in a `MVVM + C` architecture

public protocol BaseViewModel {
    associatedtype C: Coordinator
    var coordinator: C { get }
    /**
        Configuration method for `ViewModel`. Implement it if need some initial setup (e.g. API request to fetch data).

        Optional method. Do not need to call this method directly. It is called automatically in `UIViewController` LifeCycle
     */
    func setup()
}

extension BaseViewModel {
    
    func setup() {

    }
}
