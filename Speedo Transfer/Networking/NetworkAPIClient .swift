

import Foundation

final class URLSessionApiClient {
    
    private let configuration: URLSessionConfiguration
    private let session: URLSession
    
    init() {
        self.configuration = URLSessionConfiguration.default
        self.configuration.timeoutIntervalForRequest = 30.0
        self.configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        self.session = URLSession(configuration: self.configuration)
    }
        private func prepareURL(_ api: APIRequest) -> URL? {
            var urlComponents = URLComponents(string: api.url.absoluteString)
            let queryItems = api.queryParams?.map({ (key, value) in
                return URLQueryItem(name: key, value: String(describing: value) )
            })
            urlComponents?.queryItems = queryItems
            return urlComponents?.url
        }
    
    func dataTask<T: Codable>(_ api: APIRequest, onCompletion: @escaping (_ result: Result<T, Error>) -> Void) {
        
        guard let url = prepareURL(api) else {
            return onCompletion(.failure(AppError.invalidURL))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = api.method.rawValue
        urlRequest.allHTTPHeaderFields = api.headers
        urlRequest.httpBody = api.body
        
        self.session.dataTask(with: urlRequest) { data, response, error in
            
            // onFailure
            if let err = error {
                onCompletion(.failure(err))
                return
            }
            
            // Validation
            guard (200...299).contains((response as? HTTPURLResponse)?.statusCode ?? 0) else {
                onCompletion(.failure(AppError.httpFailure))
                return
            }
            
            // onSuccess
            if let data = data {
                // Transform Data to Codable Type
                if let userModel = try? JSONDecoder().decode(T.self, from: data) {
                    onCompletion(.success(userModel))
                } else {
                    onCompletion(.failure(AppError.decodingError))
                }
            } else {
                onCompletion(.failure(AppError.noHttpBody))
            }
        }.resume()
    }

}
//
//var client = URLSessionApiClient()
//
//let apiURL = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
//
//let apiRequest = APIRequest(url: apiURL, method: .POST, headers: nil, queryParams: ["NumOfPages":"1"], body: RegisterRequestBody(firstName: <#T##String#>, lastName: <#T##String#>, gender: <#T##String#>, email: <#T##String#>, phoneNumber: <#T##String#>, address: <#T##String#>, nationality: <#T##String#>, nationalNumber: <#T##String#>, dateOfBirth: <#T##String#>, password: <#T##String#>))
//
//        client.dataTask(apiURL) { (_ result: Result<PostModel, Error>) in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let data):
//                print("Data: \(data)")
//            }
//        }
//
//
//
//var client = URLSessionApiClient()
//
//{
//"userId": 1,
//"id": 1,
//"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//"body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//}
//
//struct PostModel: Codable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}
//
