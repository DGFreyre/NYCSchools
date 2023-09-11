//
//  Paths.swift
//  NYCSchools
//
//  Created by DGF on 9/10/23.
//

import Foundation
import SwiftUI

struct TopPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.98008*width, y: 0.7602*height))
        path.addCurve(to: CGPoint(x: 0.9789*width, y: 0.53605*height), control1: CGPoint(x: 0.98008*width, y: 0.7602*height), control2: CGPoint(x: 0.9789*width, y: 0.53605*height))
        path.addLine(to: CGPoint(x: 0.02743*width, y: 0.53432*height))
        path.addCurve(to: CGPoint(x: 0.02632*width, y: 0.71742*height), control1: CGPoint(x: 0.02743*width, y: 0.53432*height), control2: CGPoint(x: 0.02632*width, y: 0.71742*height))
        path.addCurve(to: CGPoint(x: 0.11827*width, y: 0.68305*height), control1: CGPoint(x: 0.05937*width, y: 0.70214*height), control2: CGPoint(x: 0.08128*width, y: 0.69368*height))
        path.addCurve(to: CGPoint(x: 0.40942*width, y: 0.6736*height), control1: CGPoint(x: 0.19981*width, y: 0.65962*height), control2: CGPoint(x: 0.33041*width, y: 0.63562*height))
        path.addCurve(to: CGPoint(x: 0.77854*width, y: 0.72762*height), control1: CGPoint(x: 0.52286*width, y: 0.72813*height), control2: CGPoint(x: 0.65558*width, y: 0.69631*height))
        path.addCurve(to: CGPoint(x: 0.98008*width, y: 0.7602*height), control1: CGPoint(x: 0.90389*width, y: 0.75954*height), control2: CGPoint(x: 0.91977*width, y: 0.78926*height))
        path.closeSubpath()
        return path
    }
}

struct BottomPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.94005*width, y: 0.7932*height))
        path.addLine(to: CGPoint(x: 0.9408*width, y: 0.52844*height))
        path.addCurve(to: CGPoint(x: 0.83712*width, y: 0.54806*height), control1: CGPoint(x: 0.92147*width, y: 0.53522*height), control2: CGPoint(x: 0.85982*width, y: 0.54471*height))
        path.addCurve(to: CGPoint(x: 0.50347*width, y: 0.48837*height), control1: CGPoint(x: 0.69541*width, y: 0.56897*height), control2: CGPoint(x: 0.6076*width, y: 0.56441*height))
        path.addCurve(to: CGPoint(x: 0.43073*width, y: 0.42894*height), control1: CGPoint(x: 0.47886*width, y: 0.46795*height), control2: CGPoint(x: 0.4578*width, y: 0.44798*height))
        path.addCurve(to: CGPoint(x: 0.22975*width, y: 0.37408*height), control1: CGPoint(x: 0.37987*width, y: 0.39148*height), control2: CGPoint(x: 0.29444*width, y: 0.39223*height))
        path.addCurve(to: CGPoint(x: 0.05919*width, y: 0.3189*height), control1: CGPoint(x: 0.19117*width, y: 0.36327*height), control2: CGPoint(x: 0.08817*width, y: 0.32066*height))
        path.addCurve(to: CGPoint(x: 0.05917*width, y: 0.79418*height), control1: CGPoint(x: 0.05919*width, y: 0.46621*height), control2: CGPoint(x: 0.06011*width, y: 0.64694*height))
        path.addCurve(to: CGPoint(x: 0.94005*width, y: 0.7932*height), control1: CGPoint(x: 0.14922*width, y: 0.7942*height), control2: CGPoint(x: 0.94005*width, y: 0.7932*height))
        path.closeSubpath()
        return path
    }
}
