//
//  MiniPlayer.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 10/08/2025.
//

import SwiftUI

struct MiniPlayer: View {
    @State private var progress = 50.0
    var body: some View {
        VStack{
            
            HStack(spacing: 15){
                //img
                Image("universe")
                    .resizable()
                    .cornerRadius(15)
                    .frame(width:55, height: 55)
                    .padding(.leading, 30)
                //details
                Spacer(minLength: 0)
                VStack{
                    Text("Song name")
                    Text("Stick Man")
                }.frame(alignment: .center)
                //start button
                Spacer(minLength: 0)
                Image(systemName: "play.circle.fill")
                    .padding(.trailing, 30)
            }
            Slider(value: $progress, in: 0...100)
                .padding(.horizontal)
                .padding(.vertical, -19.0)
        }
        .frame(height: 80)
        .background(BlurView(style: .systemChromeMaterialDark))
        .cornerRadius(25)
    }
}

#Preview {
    MiniPlayer()
}
