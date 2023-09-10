import Foundation

enum NetworkError: Error {
    case badURL, decodingError, networkError, statusNotOk, unknowError
}
