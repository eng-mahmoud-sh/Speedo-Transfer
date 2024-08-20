//
//  User.swift
//  Speedo Transfer
//

import Foundation

struct UserRegistrationRequest: Codable {
    var username: String
    var password: String
    var birthdate: String
    var email: String
    var country: String
    

    enum CodingKeys: String, CodingKey {

        case username
        case password
        case birthdate
        case email
        case country
        
    }
}
//struct RegistrationResponse: Codable {
//    var username: String
//    var email: String
//    var password: String
//}
