import Foundation
import Combine

@MainActor
final class SchoolsViewModel<T: APIServiceProtocol>: ObservableObject {
    //Property Wrappers to Listen Changes
    @Published private(set) var schoolsInfo: [Schools] = []
    @Published private(set) var errorMessage = ""
    @Published var searchSchool: String = ""
    
   //Encapsulation
    private var cancellables = Set<AnyCancellable>()
    private var service: T
    
    //Dependency Injection
    init(service: T = APIService() ) {
        self.service = service
    }
    
    func getSchools(){
        service.fetchData(Constants.url)
            .sink { completion in
                switch completion {
                case .finished:()
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] schools in
                guard let self = self else { return }
                self.schoolsInfo = schools
              //  print(schools)
            }.store(in: &cancellables)
        }

}
