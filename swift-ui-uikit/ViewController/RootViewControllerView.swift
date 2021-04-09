//
//  RootViewControllerView.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI
import Components

struct RootViewControllerView: View, ViewControllerView {
    
    @StateObject var viewModel: RootViewControllerViewModel
    
    init(viewModel: StateObject<RootViewControllerViewModel>) {
        self._viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.dataSource) { item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button("Go") {
                            viewModel.showDetails(model: item)
                        }
                        .frame(width: 50, height: 50)
                        .background(Color.green)
                    }
                    .padding()
                }
                .transition(.slide)
                .animation(.easeIn)
            }
        }
    }
}

//struct ViewControllerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewControllerView(viewModel: RootViewControllerViewModel(coordinator: RootCoordinator()))
//    }
//}
