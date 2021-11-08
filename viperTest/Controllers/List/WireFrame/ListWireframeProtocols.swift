//
//  ListWireframeProtocols.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit

// VIPER Protocol for communication from Presenter -> Wireframe
protocol ListPresenterToWireframeProtocol: AnyObject {
    func showListViewDetails(itemSelected : ListEntity)
}
