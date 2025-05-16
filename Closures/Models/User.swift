//
//  User.swift
//  Closures
//
//  Created by Onur Altintas on 16.05.2025.
//

import Foundation

struct UserResponse: Codable {
    let results: [User]
}

struct User: Codable {
    let name: Name
    let email: String
    let picture: Picture
}

struct Name: Codable {
    let first: String
    let last: String
}

struct Picture: Codable {
    let large: String
}
