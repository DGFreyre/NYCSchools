//
//  SATRowInformationView.swift
//  NYCSchools
//
//  Created by DGF on 9/11/23.
//

import SwiftUI

struct SATRowInformationView: View {
    private var title: String
    private var value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        VStack( spacing: 10){
            HStack {
                Text(title).foregroundStyle(Color.blueSecondary)
                Spacer()
            }.padding(.horizontal)
            Text(value).background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.backgroundColor).shadow(color: Color.shadowColor.opacity(0.15), radius: 2).frame(width: 330, height: 30))
        }
    }
}

