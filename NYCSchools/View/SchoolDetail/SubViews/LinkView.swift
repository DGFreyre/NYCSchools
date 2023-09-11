//
//  LinkView.swift
//  NYCSchools
//
//  Created by DGF on 9/11/23.
//

import SwiftUI

struct LinkView: View {
    private var urlPath: String
    private var url: String
    private var icon: String
    
    init(urlPath: String, url: String, icon: String) {
        self.urlPath = urlPath
        self.url = url
        self.icon = icon
    }
    
    var body: some View {
        HStack{
            Image(systemName: icon)
            if let destinationURL = URL(string: urlPath)?.appendingPathComponent(url) {
                Link(url, destination: destinationURL)
            }
            Spacer()
            Image(systemName: "chevron.right").foregroundStyle(Color.blueSecondary)
        }
    }
}

