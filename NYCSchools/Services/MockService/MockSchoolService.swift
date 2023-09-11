//
//  MockSchoolService.swift
//  NYCSchools
//
//  Created by DGF on 9/11/23.
//

import Foundation
import Combine

struct MockSchoolService: APIServiceProtocol {
    func fetchData<T>(_ endpoint: String) -> AnyPublisher<[T], NetworkError> where T : Decodable, T : Encodable {
        guard let url = Bundle.main.url(forResource: "MockSchools", withExtension: "json") else {
            print("JSON file not found")
            return Fail(error: NetworkError.badURL)
                .eraseToAnyPublisher()
        }
        let data = try? Data(contentsOf: url)
        guard let result = try? JSONDecoder().decode([T].self, from: data!) else {
            return Fail(error: NetworkError.decodingError)
                .eraseToAnyPublisher()
        }
        return Just(result)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
    
    
}
