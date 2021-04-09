//
//  SwiftUIViewController.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import UIKit
import SwiftUI

open class SwiftUIViewController<V: View & ViewControllerView>: UIViewController {

    let swiftUIView: V
    var viewModel: V.VM
    
    public init(viewModel: V.VM) {
        self.viewModel = viewModel
        swiftUIView = V(viewModel: StateObject(wrappedValue: viewModel))
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func loadView() {
        super.loadView()
        
        setupRootView()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.setup()
    }
    
    private func setupRootView() {
        let childView = UIHostingController(rootView: swiftUIView)
        self.view.addSubview(childView.view)
        childView.didMove(toParent: childView)
        
        childView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            childView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            childView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            childView.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        self.view.backgroundColor = childView.view.backgroundColor
    }
}
