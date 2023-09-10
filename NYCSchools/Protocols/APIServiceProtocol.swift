import Foundation
import Combine

protocol APIServiceProtocol {
    func fetchData<T: Codable>(_ endpoint: String) ->AnyPublisher<[T],NetworkError>
}



