//
//  HeaderTableView.swift
//  NYCSchools
//
//  Created by DGF on 9/10/23.
//
import SwiftUI

struct HeaderTableView: View {
    @Binding private var searchSchool: String
    init(searchSchool: Binding<String>) {
        _searchSchool = searchSchool
    }
    var body: some View {
        VStack {
            Image(Constants.blueLogo).resizable().scaledToFit().frame(width: 150)
            SearchBarView(searchText: $searchSchool)
            HStack {
                Text("School Name").multilineTextAlignment(.leading)
                Spacer()
                Text("School Location")
            }.font(.caption).padding(.horizontal,25)
        }
    }
}

#Preview {
    HeaderTableView(searchSchool: .constant(""))
}
