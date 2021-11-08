//
//  ListModel.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
// MARK: - ListModelElement
struct ListModelElement: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let listModelDescription: String?
    let category: String?
    let image: String?
    let rating: Rating?

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case listModelDescription = "description"
        case category, image, rating
    }
}



// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?
}

typealias ListModel = [ListModelElement]
