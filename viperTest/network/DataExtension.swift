//
//  DataExtension.swift
//  viperTest
//
//  Created by mac on 20/01/2021.
//

import Foundation
extension Data{
    func decodeObject<T:Codable>(targetModel: T.Type)->T?{
        let jsonDecoder = JSONDecoder()
        let objectDecoded = try? jsonDecoder.decode(T.self, from: self)
        return objectDecoded
    }
    
    func printJson(){
        print(String(decoding:self, as: UTF8.self))
    }
    
    
}
