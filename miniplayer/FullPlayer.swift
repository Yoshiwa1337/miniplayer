//
//  FullPlayer.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 10/08/2025.
//

import SwiftUI

struct FullscreenPlayer: View {
    @State private var progress = 50.0
    @Binding var activeSong: Bool
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
                Spacer()
                //Album art
                HStack{
                    Image("sitstill")
                }
                Spacer().frame(height: 30)
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
                Spacer().frame(height: 15)
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
                Spacer()
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
                Spacer()
                //Play-controls
                HStack{
                    //shuffle-song
                    Image(systemName: "shuffle")
                        .padding(.horizontal)
                    Spacer()
                    //previous-song
                    Image(systemName: "backward.fill")
                    Spacer()
                    //play/pause
                    Image(systemName: "play.fill")
                    Spacer()
                    //next-song
                    Image(systemName: "forward.fill")
                    Spacer()
                    //loop-song
                    Image(systemName: "repeat")
                        .padding(.horizontal)
                }
                Spacer()
                //Lyrics (backlog)
            }
//            .onAppear{
//                activeSong = true
//            }
        }.foregroundColor(.white)
    }
}

//#Preview {
//    FullscreenPlayer()
//}
