
import Foundation
import Combine

@MainActor
class SATDetailViewModel: ObservableObject {
    @Published private (set) var satInfo: [SATModel] = []
    @Published  var responseMessage = ""
    @Published  var showAlert = false
    private var cancellables = Set<AnyCancellable>()
    private var service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    func fetchSATData(_ dbn: String) {
        service.fetchData("\(Constants.satURL)?dbn=\(dbn)")
            .sink { completion in
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.responseMessage = "No Data Found"
                }
            } receiveValue: { [weak self] (satInfo: [SATModel]) in
                guard let self = self else { return }
                if satInfo.isEmpty {
                self.showAlert = true
                self.responseMessage = "No SAT data available for this school."
                } else {
                self.satInfo = satInfo
                }
                print(satInfo)
            }.store(in: &cancellables)

    }
    
    
    
    
}
