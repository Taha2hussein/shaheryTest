//
//  ListEntity.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import Foundation
struct ListEntity:Codable {
    let image:String
    let title:String
    let price:Double
    let category:String
}
typealias ListEntitys = [ListEntity]

  
