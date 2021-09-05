//
//  RootViewControllerView.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

struct RootViewControllerView: View, ViewControllerView {

    @ObservedObject var viewModel: RootViewControllerViewModel

    var body: some View {
        List(viewModel.dataSource) { item in
            HStack {
                Button(action: {
                    viewModel.showDetails(model: item)
                }, label: {
                    HStack {
                        Text(item.title)
                        Spacer()
                    }
                    .padding()
                })
            }
        }
    }
}

struct RootViewControllerView_Previews: PreviewProvider {
    static var previews: some View {
        RootViewControllerView(viewModel: RootViewControllerViewModel(coordinator: RootCoordinator()))
    }
}
