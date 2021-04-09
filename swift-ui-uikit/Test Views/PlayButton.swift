//
//  PlayButton.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

struct PlayButton: View {
    
    
    var action: (() -> Void)
    
    var body: some View {
        Button(action: action, label: {
            HStack{
                Spacer()
                Image(systemName: "play.fill")
                Text("Play")
                    .bold()
                Spacer()
            }
            .padding(2)
            .background(Color.white)
            .cornerRadius(2)
        })
        .buttonStyle(PlainButtonStyle())
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            PlayButton(action: {
                
            })
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
    }
}
