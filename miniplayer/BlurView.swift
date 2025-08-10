//
//  BlurView.swift
//  miniplayer
//
//  Created by Yoshi Forbes on 10/08/2025.
//

import SwiftUI

struct BlurView: UIViewRepresentable{
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let blurEffect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: blurEffect)

        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

#Preview {
    BlurView(style: .systemChromeMaterial)
        .frame(height: 60)
}
