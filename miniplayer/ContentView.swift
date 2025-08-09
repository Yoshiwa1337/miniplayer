//
//  ContentView.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 09/08/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            HStack{
                Image(systemName: "chevron.up").foregroundColor(.white)
                    .padding(.horizontal)
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
