//
//  UIApplication.swift
//  NYCSchools
//
//  Created by DGF on 9/10/23.
//

import Foundation
import SwiftUI


extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
