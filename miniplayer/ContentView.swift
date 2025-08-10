//
//  ContentView.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 09/08/2025.
//

import SwiftUI

//Default/miniplayer view
struct ContentView: View {
    @State var isPlayerExpanded = false
    @Namespace var animation

    func player(){
        withAnimation(.spring()){
            isPlayerExpanded.toggle()
        }
    }

    var body: some View {
        ZStack(alignment: .top){
            Color(red: 40/255, green: 40/255, blue: 40/255).ignoresSafeArea() //Fixes white space image generates
            VStack{
                Image("universe")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipped()
                    .ignoresSafeArea()
                LinearGradient(colors: [Color(red: 40/255, green: 40/255, blue: 40/255),Color(red: 200/255, green: 200/255, blue: 200/255)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            }
//                .mask(
//                    VStack(spacing: 0){
//                        Rectangle().frame(height: 490)
//                    }
//                )
            VStack{
                //Top section
                HStack{
                    Image(systemName: "chevron.left").padding(.horizontal)
                    //Artist
                    Spacer()
                    Text("Artist")
                    Spacer()
                    //
                    Image(systemName: "ellipsis.circle").padding(.horizontal)
                }
                
                //Artist details
                HStack{
                    Text("Stick\nMan").padding()
                        .font(.title.bold())
                    Spacer()
                }
                HStack{
                    //details
                    Text("16,105,208 monthly listeners").padding(.horizontal)
                    Spacer()
                    Button("Follow"){}.padding(.horizontal)
                        .fontWeight(.bold)
                    
                    
                }.padding()
                
                //Subheaders
                HStack{
                    Text("Popular").padding(.horizontal)
                    Spacer()
                    Text("Albums").underline()
                    Spacer()
                    Text("Singles").padding(.horizontal)
                }
                
                //Albums
                HStack{
                    VStack{
                        Image("sitstill")
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Text("Stick of Life")
                        Text("2020")
                    }
                    VStack{
                        Image("sitstill")
                            .resizable()
                            .cornerRadius(15)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Text("Missing Colour")
                        Text("2024")
                    }
                }
                
                //Songs
                VStack{
                    HStack{
                        Text("Align help").opacity(0)
                        Spacer()
                        Text("Song").fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Spacer()
                        Text("See all")
                            .padding(.horizontal)
                    }
                    //1
                    Button{
                        withAnimation(.spring()){isPlayerExpanded.toggle()}
                    } label:{
                        
                        HStack{
                            //img
                            Image("sitstill")
                                .resizable()
                                .cornerRadius(15)
                                .frame(width:75, height: 50)
                                .padding(10)
                                .padding(.leading, 30)
                            //details
                            VStack{
                                Text("Song name")
                                Text("Stick Man")
                            }
                            Spacer()
                            //start button
                            Image(systemName: "play.circle.fill")
                                .padding(.trailing, 30)
                        }
                    }
                    //2
                    Button{
                        withAnimation(.spring()){isPlayerExpanded.toggle()}
                    } label:{
                        
                        HStack{
                            //img
                            Image("sitstill")
                                .resizable()
                                .cornerRadius(15)
                                .frame(width:75, height: 50)
                                .padding(10)
                                .padding(.leading, 30)
                            //details
                            VStack{
                                Text("Song name")
                                Text("Stick Man")
                            }
                            Spacer()
                            //start button
                            Image(systemName: "play.circle.fill")
                                .padding(.trailing, 30)
                        }
                    }
                    //3
                    Button{
                        withAnimation(.spring()){isPlayerExpanded.toggle()}
                    } label:{
                        
                        HStack{
                            //img
                            Image("sitstill")
                                .resizable()
                                .cornerRadius(15)
                                .frame(width:75, height: 50)
                                .padding(10)
                                .padding(.leading, 30)
                            //details
                            VStack{
                                Text("Song name")
                                Text("Stick Man")
                            }
                            Spacer()
                            //start button
                            Image(systemName: "play.circle.fill")
                                .padding(.trailing, 30)
                        }
                    }

                }.padding(.top)
                
            
                
                //Miniplayer
                MiniPlayer(animation: animation, isPlayerExpanded: $isPlayerExpanded)
                
                //Footer
                HStack{
                    Image(systemName: "safari").padding(.horizontal)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    Image(systemName: "person").padding(.horizontal)
                }.foregroundColor(.black).font(.system(size: 30)).ignoresSafeArea()
                
                
//                Spacer()
//                VStack{
//                    Button("show player"){
//                        withAnimation(.spring()){
//                            isPlayerExpanded = true
//                        }
//                    }
//                }
                
            }.foregroundColor(.white)
            
        }
        //fix for alignment
        .overlay{
            
            if isPlayerExpanded {
                FullscreenPlayer(onArrowTap: player)
                    .opacity(isPlayerExpanded ? 1:0)
                    .transition(.move(edge: .bottom).combined(with: .opacity)).zIndex(1000)
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
        }.foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
