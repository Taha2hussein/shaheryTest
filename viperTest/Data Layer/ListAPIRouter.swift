//
//  ListAPIRouter.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import Foundation
import Alamofire
enum ListAPIRouter:Routerable {
    case List(body:ListRequestEntity)
   
    var Parameters: Parameters?{
        switch self {
        case .List(let body):
            return self.compineParams(currentRequestBody: body)
        
        }
    }
}
