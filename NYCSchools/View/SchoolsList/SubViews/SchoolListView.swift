//
//  SchoolListView.swift
//  NYCSchools
//
//  Created by DGF on 9/10/23.
//

import SwiftUI

struct SchoolListView: View {
    
    private var schools: [Schools]
    
    init(schools: [Schools]) {
        self.schools = schools
    }
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(schools, id: \.self){ school in
                    NavigationLink {
                        SchoolDetailView(school: school)
                    } label: {
                        SchoolRowView(schoolName: school.schoolName, schoolCity: school.city)
                    }.listRowSeparator(.hidden)
                    
                }
            }
        }
    }
}

#Preview {
    SchoolListView(schools: [Schools]())
}
