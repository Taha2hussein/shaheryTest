//
//  ListDetailsViewProtocols.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
// VIPER Protocol for communication from Presenter -> View
protocol ListDetailsPresenterToViewProtocol: class {
    func showProduct(product:ListEntity?)
}
