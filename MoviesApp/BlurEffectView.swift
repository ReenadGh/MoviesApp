//
//  BlurEffectView.swift
//  MoviesApp
//
//  Created by Reenad gh on 15/04/1444 AH.
//

import Foundation
import SwiftUI

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style 
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}


extension Color {
    static var darkBackground = Color("background")
}
