//
//  ListInteractorProtocols.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
//MARK:- VIPER Protocol for communication from Presenter to Interactor
protocol ListPresenterToInteractorProtocol: class {
    func getProductsFromApi(limit:Int)
}
