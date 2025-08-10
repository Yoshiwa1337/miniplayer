//
//  MiniPlayer.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 10/08/2025.
//

import SwiftUI

struct MiniPlayer: View {
    //initialised vars
    @State private var progress = 50.0
    @State var yPos: CGFloat = 0
    @Binding var activeSong: Bool
    var animation: Namespace.ID
    @Binding var isPlayerExpanded: Bool
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
        .frame(maxHeight: isPlayerExpanded ? .infinity: 80)
        .background(BlurView(style: .systemChromeMaterialDark))
        //tap to expand
        .onTapGesture {
            withAnimation(.spring()){isPlayerExpanded.toggle()}
        }
        .offset(y: max(yPos, -30)) //view follows dragging
        .gesture(
            DragGesture(minimumDistance: 8, coordinateSpace: .local)
                .onChanged{
                    //tracking current drag y position
                    value in yPos = value.translation.height
                }
                .onEnded{
                    //range for opening fullscreen
                    value in let shouldOpen = value.translation.height < -50
                    withAnimation(.spring(response: 0.45, dampingFraction: 0.85)){
                        if shouldOpen { isPlayerExpanded = true }
                        if yPos >= 80 { activeSong = false }
                        yPos = 0
                    }
                }
        )
        .cornerRadius(25)
    }
}

//#Preview {
//    MiniPlayer(animation: animation, isPlayerExpanded: $isPlayerExpanded)
//}
