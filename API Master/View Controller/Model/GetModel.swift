//
//  GetModel.swift
//  API Master
//
//  Created by TPFLAP146 on 04/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import Foundation

//MARK: - Get Response Model
struct GetResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UserData]
    let ad: Ad

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, ad
    }
}

struct Ad: Codable {
    let company: String
    let url: String
    let text: String
}

struct UserData: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

