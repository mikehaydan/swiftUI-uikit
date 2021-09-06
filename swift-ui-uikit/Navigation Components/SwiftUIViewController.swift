//
//  SwiftUIViewController.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI
import UIKit
/**
 Abstract class which is wraps a "View" from `MVVM + Coordinator` scene  into view controller

 `View` has to conform `ViewControllerView` protocol.

 `ViewModel` has to conform `BaseViewModel` protocol.

 ~~~
 // Example usage:

 final class ExampleViewModel: BaseViewModel, ObservableObject {
 ...

 func setup() {
 // setup VM
 }
 ...
 }

 final class ExampleView: View, ViewControllerView  {

 @ObservedObject private var viewModel: ExampleViewModel

 init(viewModel: ExampleViewModel) {
 self.viewModel = viewModel
 }

 var body: some View {
 Rectangle()
 }
 }

 final class  ExampleController: SwiftUIViewController<ExampleView>  {
 ...
 }

 ...

 let viewModel = ExampleViewModel()
 let controller = ExampleController(viewModel: viewModel)
 ~~~
 */

class SwiftUIViewController<V: ViewControllerView>: UIViewController {

    // MARK: - Public Properties

    var viewModel: V.VM

    var ignoredSafeAreaEdges: Set<Edge> {
        didSet {
            if oldValue == ignoredSafeAreaEdges {
                return
            }
            setupChildViewConstraints()
        }
    }

    /// Represents `ViewControllerView` added to the view controller.
    private(set) weak var childUIView: UIView!

    // MARK: - Private Properties

    private let childView: V

    // MARK: - LifeCycle

    /// init controller with `ViewControllerView` protocol and ignored safe are edges. By default `top` edge is ignored
    init(viewModel: V.VM, ignoredSafeAreaEdges: Set<Edge> = Set([Edge.bottom, Edge.leading, Edge.trailing])) {
        self.viewModel = viewModel
        self.ignoredSafeAreaEdges = ignoredSafeAreaEdges
        childView = V(viewModel: viewModel)

        super.init(nibName: nil, bundle: nil)

        if String(describing: type(of: self)) == String(describing: SwiftUIViewController.self) {
            fatalError("`SwiftUIViewController` has to be inherited")
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public

    override func loadView() {
        super.loadView()

        setupRootView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.setup()
    }

    // MARK: - Private

    private func setupRootView() {
        let childController = childView.viewController

        view.addSubview(childController.view)
        childController.didMove(toParent: self)

        childController.view.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = childController.view.backgroundColor
        childUIView = childController.view
        setupChildViewConstraints()
    }

    private func setupChildViewConstraints() {
        childUIView.removeConstraints(childUIView.constraints)

        NSLayoutConstraint.activate([
            childUIView.topAnchor.constraint(equalTo: ignoredSafeAreaEdges.contains(.top)
                                                ? view.topAnchor
                                                : view.safeAreaLayoutGuide.topAnchor),
            childUIView.leadingAnchor.constraint(equalTo: ignoredSafeAreaEdges.contains(.leading)
                                                    ? view.leadingAnchor
                                                    : view.safeAreaLayoutGuide.leadingAnchor),
            childUIView.trailingAnchor.constraint(equalTo: ignoredSafeAreaEdges.contains(.trailing)
                                                    ? view.trailingAnchor
                                                    : view.safeAreaLayoutGuide.trailingAnchor),
            childUIView.bottomAnchor.constraint(equalTo: ignoredSafeAreaEdges.contains(.bottom)
                                                    ? view.bottomAnchor
                                                    : view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
