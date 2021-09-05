//
//  DetailsView.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

struct DetailsView: View, ViewControllerView {

    @ObservedObject var viewModel: DetailsViewModel

    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.title)
                    .font(.title)
                Spacer()
                    .frame(height: 100)
                Text(viewModel.description)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .background(Color.blue)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel(title: "Title",
                                                description: "Description",
                                                baseCoordinator: RootCoordinator()))
    }
}
