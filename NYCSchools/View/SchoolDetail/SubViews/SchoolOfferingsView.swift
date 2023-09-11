//
//  SchoolOfferingsView.swift
//  NYCSchools
//
//  Created by DGF on 9/11/23.
//

import SwiftUI

struct SchoolOfferingsView: View {
    private var sports: String
    init(sports: String) {
        self.sports = sports
    }
    var body: some View {
        VStack(alignment: .leading){
            Text("School Sports").font(.custom("ZillaSlab-Medium", size: 21)).foregroundStyle(Color.blueSecondary)
            VStack(alignment: .leading) {
                Text(sports)
            }.multilineTextAlignment(.leading).padding(.horizontal).foregroundStyle(Color.secondaryTextColor).frame(width: 340, height: 100).background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor).shadow(color:Color.black.opacity(0.15), radius: 4))
        }
    }
}

struct HeaderLogoView: View {
    private var title: String
    
    init(title: String) {
        self.title = title
    }
    var body: some View {
        VStack {
            Image(Constants.blueLogo).resizable().scaledToFit().frame(width: 150)
            Text(title).font(.custom("MontserratAlternates-Regular", size: 20))
        }
    }
}


struct ReusableButtonView: View {
    private var text: String
    init(text: String) {
        self.text = text
    }
    var body: some View {
            Text(text).foregroundStyle(Color.white).background(
                RoundedRectangle(cornerRadius: 10).fill(Color.blueSecondary).frame(width: 340,height: 40))
    }
}
