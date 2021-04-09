//
//  DetailsController.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import UIKit
import Components
import SwiftUI

final class DetailsController: SwiftUIViewController<DetailsView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = "Details"
    }
}
