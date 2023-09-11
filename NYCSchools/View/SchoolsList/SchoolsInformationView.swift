import SwiftUI

struct SchoolsInformationView: View {
    @StateObject private var vm = SchoolsViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueBackground.opacity(0.5).ignoresSafeArea()
                VStack {
                    HeaderTableView(searchSchool: $vm.searchSchool)
                    SchoolListView(schools: vm.schoolsInfo)
                }
            }
        }.onAppear{
            vm.getSchools()
        }
    }
}

#Preview {
        SchoolsInformationView()
}


struct SchoolRowView: View {
    private var schoolName:String
    private var schoolCity: String
    
    init(schoolName: String, schoolCity: String) {
        self.schoolName = schoolName
        self.schoolCity = schoolCity
    }
    
    var body: some View {
            HStack() {
                Text(schoolName).font(.custom("MontserratAlternates-Regular", size: 14)).foregroundStyle(Color.secondaryText)
                Spacer()
                Text(schoolCity).font(.caption).foregroundStyle(Color.blueSecondary)
               
            }.frame(width: 340, height: 40).padding()
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor).shadow(color:Color.shadowColor.opacity(0.15), radius: 3, x: 0, y: 0)
            )
    }
}


struct SchoolDetailView: View {
    var school: Schools

    var body: some View {
        
        NavigationLink(destination: SATSchoolInformationView(dbn: school.dbn), label: {
            Text(school.schoolName)
        })
    }
}


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
        }.font(.headline)
            .padding()
            .background(RoundedRectangle(cornerRadius: 25)
                .fill(Color.backgroundColor)
                .shadow(color: Color.shadowColor.opacity(0.15), radius: 5, x: 0, y: 0)
            ).padding()
    }
}




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
