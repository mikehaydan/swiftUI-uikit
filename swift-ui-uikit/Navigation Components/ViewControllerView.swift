//
//  ViewControllerView.swift
//
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

/// `View` protocol for `UIKit` navigation in `MVVM+C` architecture
public protocol ViewControllerView {
    associatedtype VM: BaseViewModel

    init(viewModel: VM)

    /// a `View` wrapped into `UIViewController`
    ///
    /// For example, for `SwiftUI.View` it is a `UIHostingViewController`
    var viewController: UIViewController { get }
}


extension View {
    var viewController: UIViewController {
        return UIHostingController(rootView: self)
    }
}
