import Foundation
import Combine

@MainActor
final class SchoolsViewModel<T: APIServiceProtocol>: ObservableObject {
    
    //Property Wrappers to Listen Changes
    @Published private var schoolsInfo: [Schools] = []
    @Published private(set) var errorMessage = ""
    @Published var searchSchool: String = ""
    @Published private(set) var searchResults: [Schools] = []
    
   //Encapsulation
    private var cancellables = Set<AnyCancellable>()
    private var service: T
    
    //Dependency Injection
    init(service: T = APIService() ) {
        self.service = service
        getSchools()
    }
    //Func to filter school name
    func search() {
        searchResults = schoolsInfo
        if !searchSchool.isEmpty {
            searchResults = searchResults.filter({ schools in
                schools.schoolName.uppercased().contains(searchSchool.uppercased())
            })
        }
    }
    
    func getSchools(){
        service.fetchData(Constants.url)
            .sink { completion in
                switch completion {
                case .finished:()
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] (schools: [Schools]) in
                guard let self = self else { return }
                let sorted = schools.sorted { $0.city.lowercased() < $1.city.lowercased()}
                self.schoolsInfo = sorted
                self.searchResults = sorted
              
            }.store(in: &cancellables)
        }

}
