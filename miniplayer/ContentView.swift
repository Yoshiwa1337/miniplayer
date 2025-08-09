//
//  ContentView.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 09/08/2025.
//

import SwiftUI

//Default/miniplayer view
struct ContentView: View {
    @State private var isPlayerExpanded = false

    func player(){
        withAnimation(.spring()){
            isPlayerExpanded.toggle()
        }
    }

    var body: some View {
        ZStack{
            Color.green
            
            VStack{
                Button("show player"){
                    withAnimation(.spring()){
                        isPlayerExpanded = true
                    }
                }
            }
            
            if isPlayerExpanded {
                FullscreenPlayer(onArrowTap: player).transition(.move(edge: .top).combined(with: .opacity)).zIndex(1)
            }
        }
    }
    
}

//Fullscreen view
struct FullscreenPlayer: View {
    @State private var progress = 50.0
    //add swipe down functionality later
    let onArrowTap: () -> Void
   
    var body: some View {
        ZStack(alignment: .top){
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack{
                //Top section
                HStack{
                    Button(action: onArrowTap){
                        Image(systemName: "chevron.up")
                            .padding(.horizontal)
                    }
                    Spacer()
                    Text("Now playing")
                    Spacer()
                    Image(systemName: "ellipsis.circle")
                        .padding(.horizontal)
                }
                //Album art
                HStack{
                    Image("sitstill")
                }
                //Track info
                HStack{
                    VStack{
                        //Title
                        Text("Feeling Lonely")
                        Spacer().frame(height: 15)
                        //Song
                        Text("soy Pablo")
                    }
                }
                //User-reactions (do like but put sharing in the backlog)
                HStack{
                    //like
                    Image(systemName: "heart")
                        .padding(.horizontal)
                    Spacer()
                    //share
                    Image(systemName: "square.and.arrow.up")
                        .padding(.horizontal)
                }
                //Progress bar
                VStack{
                    Slider(value: $progress, in: 0...100)
                        .padding(.horizontal)
                    
                    HStack{
                        Text("0:00")
                        Spacer()
                        Text("3:30")
                    }.padding(.horizontal)
                }
                //Play-controls
            }
        }.foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
