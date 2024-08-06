//  SignInPresenter.swift
//  Speedo Transfer
//

import Foundation

protocol SignInPresenterDelegate: AnyObject {
    func didLoginSuccessfully()
    func didLoginWithFailure(error: Error)
}

final class SignInPresenter {
    private let apiClient: URLSessionApiClient
    weak var delegate: SignInPresenterDelegate?
    
    init(apiClient: URLSessionApiClient) {
        self.apiClient = apiClient
    }
    
    func login(username: String, password: String) {
        let loginRequest = LoginRequest(email: username, password: password)
        guard let loginURL = URL(string: "http://18.156.119.108:8080/api/login") else { return }
        
        let apiRequest = APIRequest(
            url: loginURL,
            method: .POST,
            headers: nil,
            queryParams: nil,
            body: try? JSONEncoder().encode(loginRequest)
        )
        
        apiClient.dataTask(apiRequest) { [weak self] (result: Result<LoginResponse, Error>) in
            switch result {
            case .success(let response):
                if let token = response.token {
                    UserDefaults.standard.setValue(token, forKey: "APIToken")
                    self?.delegate?.didLoginSuccessfully()
                } else {
                    // Handle unexpected response
                    self?.delegate?.didLoginWithFailure(error: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"]))
                }
            case .failure(let error):
                self?.delegate?.didLoginWithFailure(error: error)
            }
        }
    }
}
