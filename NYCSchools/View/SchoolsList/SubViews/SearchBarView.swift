//
//  SearchBarView.swift
//  NYCSchools
//
//  Created by DGF on 9/10/23.
//

import SwiftUI
    
struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundStyle(Color.backgroundBlue)
            TextField("Search by school name", text: $searchText)
                .foregroundStyle(Color.secondaryTextColor)
                .autocorrectionDisabled(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
            .padding()
            .background(RoundedRectangle(cornerRadius: 25)
                .fill(Color.backgroundColor)
                .shadow(color: Color.shadowColor.opacity(0.15), radius: 5, x: 0, y: 0)
            ).padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
