import SwiftUI

struct ContentView: View {
    @StateObject private var vm = SchoolsViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.schoolsInfo, id: \.self){ school in
                    SchoolRowView(school: school)
                }
            }
        }.onAppear{
            vm.getSchools()
        }
    }
}

#Preview {
    ContentView()
}


struct SchoolRowView: View {
     var school: Schools
    
    var body: some View {
        VStack {
            NavigationLink(destination: SchoolDetailView(school: school)) {
                    Text(school.schoolName)
            }
        }
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
