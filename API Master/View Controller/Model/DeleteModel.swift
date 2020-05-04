//
//  DeleteModel.swift
//  API Master
//
//  Created by TPFLAP146 on 04/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import Foundation

//MARK: - Delete Request Model
struct DeleteRequest: Codable {
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
