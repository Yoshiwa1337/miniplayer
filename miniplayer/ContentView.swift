//
//  ContentView.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 09/08/2025.
//

import SwiftUI

//Default/miniplayer view
struct ContentView: View {
    //initialised vars
    @State var isPlayerExpanded = false
    @State var activeSong = false
    @Namespace var animation
    let iconSize: CGFloat = 35
    let mainIconSize: CGFloat = 44

    func player(){
        withAnimation(.spring()){
            isPlayerExpanded.toggle()
            activeSong = true
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
                                .font(.system(size: iconSize))
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
                                .font(.system(size: iconSize))
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
                                .font(.system(size: iconSize))
                        }
                    }

                }.padding(.top)
                
            
                
                //Miniplayer
                if activeSong{
                    MiniPlayer(activeSong: $activeSong, animation: animation, isPlayerExpanded: $isPlayerExpanded)
                }
                Spacer()
                
                //Footer
                HStack(){
                    Image(systemName: "safari").padding(.horizontal)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    Image(systemName: "person").padding(.horizontal)
                }.padding(.top).foregroundColor(.black)
                    .font(.system(size: iconSize))
                    .ignoresSafeArea()
                
                
                
            }.foregroundColor(.white)
            
        }
        //fix for alignment
        .overlay{
            
            if isPlayerExpanded {
                FullscreenPlayer(activeSong: $activeSong, onArrowTap: player)
                    .opacity(isPlayerExpanded ? 1:0)
                    .transition(.move(edge: .bottom).combined(with: .opacity)).zIndex(1)
            }
        }
    }
    
}

//Fullscreen view

#Preview {
    ContentView()
}
