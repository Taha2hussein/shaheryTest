//
//  ListRequestEntity.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import Foundation

struct ListRequestEntity:Codable {
    var limit:Int
    
     
     enum CodingKeys: String, CodingKey {
        case limit = "limit"
        
     }
}









