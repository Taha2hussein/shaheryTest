//
//  ListTransformer.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import Foundation
struct ListTransformer {
    
    func transformListResponse(from responseData:ListModel)-> ListEntitys{
        let item: ListEntitys? = responseData.map({ (item) in
        return ListEntity(image: item.image ?? ""
                           , title: item.title ?? "",
                           price: item.price ?? 0.0,
                          category: item.category ?? ""
  
        )
        })
        return item ?? []
    }
}
