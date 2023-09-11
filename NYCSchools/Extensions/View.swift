//
//  View.swift
//  NYCSchools
//
//  Created by DGF on 9/10/23.
//

import Foundation
import SwiftUI

extension View {
    func customShapeModifier(_ y: CGFloat, _ yShadow: CGFloat, _ width: CGFloat) -> some View {
        self.modifier(CustomShapeModifier(yOffset: y, yShadow: yShadow, width: width))
    }
}

struct CustomShapeModifier: ViewModifier {
   private var yOffset: CGFloat
    private var yShadow: CGFloat
    private var width: CGFloat
    init(yOffset : CGFloat = -460, yShadow: CGFloat = 2,width :CGFloat){
        self.yOffset = yOffset
        self.yShadow = yShadow
        self.width = width
    }
    func body(content: Content) -> some View {
        content
            .frame(width: width).offset(x:0, y: yOffset).shadow(color: Color.shadow.opacity(0.15), radius: 2,x: 0, y: yShadow).ignoresSafeArea()
    }
}
