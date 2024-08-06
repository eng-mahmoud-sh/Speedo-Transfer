//
//  LoginResponse.swift
//  Speedo Transfer
//

import Foundation

struct LoginResponse: Codable {
    let token: String?
    let tokenType: String?
    let message: String?
    let status: String?
}
