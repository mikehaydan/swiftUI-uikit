//
//  DetailsView.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI
import Components

class X: ObservableObject {
    @State var val: Int = 5
}


struct DetailsView: View, ViewControllerView {
    
    @StateObject var viewModel: DetailsViewModel
    
    init(viewModel: StateObject<DetailsViewModel>) {
        self._viewModel = viewModel
    }
    
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
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(viewModel: DetailsViewModel(title: "Title",
//                                                description: "LOLOLO",
//                                                baseCoordinator: RootCoordinator()))
//    }
//}
