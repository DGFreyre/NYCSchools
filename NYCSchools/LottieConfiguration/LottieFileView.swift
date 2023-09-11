//
//  LottieFileView.swift
//  NYCSchools
//
//  Created by DGF on 9/10/23.
//

import Foundation
import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    
    let lottieFile: String
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        _ = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = .loop
        return animationView
    }
    
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
        
    }
}
