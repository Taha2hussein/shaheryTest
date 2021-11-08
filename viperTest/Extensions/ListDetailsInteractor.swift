//
//  ListDetailsInteractor.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
class ListDetailsInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: ListDetailsInteractorToPresenterProtocol!
}

// MARK: - Presenter To Interactor Protocol
extension ListDetailsInteractor: ListDetailsPresenterToInteractorProtocol {
    
    
}
