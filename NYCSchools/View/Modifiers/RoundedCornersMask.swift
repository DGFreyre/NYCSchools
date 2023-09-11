//
//  RoundedCornersMask.swift
//  NYCSchools
//
//  Created by DGF on 9/10/23.
//

import SwiftUI

struct RoundedCornersMask: View {
    var corners: UIRectCorner
    var radius: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let bounds = CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height)
                path.addRoundedRect(
                    in: bounds,
                    cornerSize: CGSize(width: radius, height: radius),
                    transform: .identity
                )
            }
            .fill(Color.black)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .clipped()
    }
}

