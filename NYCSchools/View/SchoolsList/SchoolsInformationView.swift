import SwiftUI

struct SchoolsInformationView: View {
    @StateObject private var vm = SchoolsViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueBackground.opacity(0.5).ignoresSafeArea()
                VStack {
                    HeaderTableView(searchSchool: $vm.searchSchool)
                    SchoolListView(schools: vm.searchResults)
                }.onChange(of: vm.searchSchool) { _ in
                    vm.search()
                }
            }
        }
        .onAppear {
            vm.getSchools()
        }
    }
}

#Preview {
    SchoolsInformationView()
}









