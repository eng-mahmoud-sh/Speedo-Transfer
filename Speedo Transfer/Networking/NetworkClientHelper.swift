

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

struct APIRequest {
    let url: URL
    let method: HTTPMethod
    let headers: [String: String]?
    let queryParams: [String: Any]?
    let body: Data?
    
}

enum AppError: Error {
    case invalidURL
    case httpFailure
    case decodingError
    case noHttpBody
}

