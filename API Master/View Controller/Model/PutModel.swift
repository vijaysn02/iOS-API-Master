//
//  PutModel.swift
//  API Master
//
//  Created by TPFLAP146 on 04/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import Foundation

//MARK: - Put Request Model
struct PutRequest: Codable {
    let name:String
    let job:String
    
    enum CodingKeys:String, CodingKey {
        case name,job
    }
    
    var dictionary: [String: String] {
              return ["name": name,
                      "job":job]
    }
    
}



// MARK: - Update Response
struct PutResponse: Codable {
    let updatedAt: String
}
