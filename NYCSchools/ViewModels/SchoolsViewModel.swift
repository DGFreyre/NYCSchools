import Foundation
import Combine

@MainActor
final class SchoolsViewModel: ObservableObject {
    @Published private(set) var schoolsInfo: [Schools] = []
    @Published private(set) var errorMessage = ""
    private var cancellables = Set<AnyCancellable>()
    private var service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService() ) {
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
                print(schools)
            }.store(in: &cancellables)
        }

}
