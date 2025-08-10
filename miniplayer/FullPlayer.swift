//
//  FullPlayer.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 10/08/2025.
//

import SwiftUI

struct FullscreenPlayer: View {
    //initialised vars
    @State private var progress = 50.0
    @Binding var activeSong: Bool
    @State var yPos: CGFloat = 0
    @State var offset: CGFloat = 0
    @State var likeText = "heart"
    @State var likeColour = false

    //like btn functionality
    func liked() -> Void {
        likeColour.toggle()
        if likeColour{
            likeText = "heart.fill"
        }
        else{
            likeText = "heart"
        }
    }
    
    //add swipe down functionality later
    let onArrowTap: () -> Void
    
    
   
    var body: some View {
        ZStack(alignment: .top){
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .cornerRadius(20)
                .ignoresSafeArea()
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
                }.padding(.top)
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
                    Button(action: liked){
                        if likeColour{
                            Image(systemName: likeText)
                                .padding(.horizontal)
                            .foregroundColor(.red)
                        }
                        else{
                            Image(systemName: likeText)
                                .padding(.horizontal)
                        }
                    }
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
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 40))
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
        }.foregroundColor(.white)
            .offset(y: offset) //view follows dragging
            .gesture(
                DragGesture(minimumDistance: 100, coordinateSpace: .local)
                    .onChanged{
                        //tracking current drag y position
                        value in yPos = max(value.translation.height, 0)
                        offset = value.translation.height
                    }
                    .onEnded{
                        //range for closing fullscreen
                        value in let shouldClose = value.translation.height > 100 || value.predictedEndTranslation.height > 300
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)){
                            offset = 0
                            if shouldClose { onArrowTap() }
                        }
                    }
            )
    }
}

//#Preview {
//    FullscreenPlayer()
//}
