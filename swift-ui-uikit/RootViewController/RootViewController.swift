//
//  ViewController.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import UIKit

final class RootViewController: SwiftUIViewController<RootViewControllerView> {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Root"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        childUIView?.backgroundColor = .green
    }
}

