//
//  ListDetailsPresenterProtocols.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
// VIPER Protocol for communication from Interactor -> Presenter
protocol ListDetailsInteractorToPresenterProtocol: class {
    
}

// VIPER Protocol for communication from View -> Presenter
protocol ListDetailsViewToPresenterProtocol: class {
    func viewDidLoad()
    func viewWillAppear()
    
}
