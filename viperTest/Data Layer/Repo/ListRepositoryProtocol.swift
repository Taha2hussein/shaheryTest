//
//  ListRepositoryProtocol.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import Foundation
import Foundation

import RxSwift
import SwiftyJSON

protocol ListRepositoryProtocol {
    func getList(withlimit limit:Int)-> Observable<ListEntitys>
}
