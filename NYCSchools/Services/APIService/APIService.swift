
import Foundation
import Combine


struct APIService: APIServiceProtocol {

    func fetchData<T>(_ endpoint: String) -> AnyPublisher<[T], NetworkError> where T : Decodable, T : Encodable {
        guard let url = URL(string: endpoint) else {
            return Fail(error: NetworkError.badURL).eraseToAnyPublisher()
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw NetworkError.statusNotOk
                }
                
                guard let result = try? JSONDecoder().decode([T].self, from: data) else {
                    throw NetworkError.decodingError
                }
                return result
            }
            .mapError{ error in
                NetworkError.unknowError
            }.eraseToAnyPublisher()
    }
}


