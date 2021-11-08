//
//  ListViewControllerProtocols.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
// VIPER Protocol for communication from Presenter -> View
protocol ListPresenterToViewProtocol: AnyObject {
    func reloadTableView()
    func showProductLoader()
    func hideProductLoader()
    func showMessage(message:String)
}
