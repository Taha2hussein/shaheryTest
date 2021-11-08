//
//  ListDetailsPresenter.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
class ListDetailsPresenter {
    
    // MARK: - VIPER Stack
    weak var view: (ListDetailsPresenterToViewProtocol &  UIViewController)!
    var interactor: ListDetailsPresenterToInteractorProtocol!
    var wireframe: ListDetailsPresenterToWireframeProtocol!
    var productItem : ListEntity?
    
    // MARK: - Instance Variables
    
    init(wireframe: ListDetailsPresenterToWireframeProtocol,
         view: ListDetailsPresenterToViewProtocol,
         interactor: ListDetailsPresenterToInteractorProtocol) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view as? (ListDetailsPresenterToViewProtocol &  UIViewController)
    }
    
}

// MARK: - Interactor to Presenter Protocol
extension ListDetailsPresenter: ListDetailsInteractorToPresenterProtocol {
    
    
}

// MARK: - View to Presenter Protocol
extension ListDetailsPresenter: ListDetailsViewToPresenterProtocol {
    func viewDidLoad() {
        view.showProduct(product: self.productItem)
    }
    
    func viewWillAppear() {
        
    }
}

