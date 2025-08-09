//
//  ContentView.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 09/08/2025.
//

import SwiftUI

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
struct FullscreenPlayer: View {
    let onArrowTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .top){
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            HStack{
                Button(action: onArrowTap){
                    Image(systemName: "chevron.up").foregroundColor(.white)
                        .padding(.horizontal)
                }
                Spacer()
                Text("Now playing").foregroundColor(.white)
                Spacer()
                Image(systemName: "ellipsis.circle").foregroundColor(.white)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}
