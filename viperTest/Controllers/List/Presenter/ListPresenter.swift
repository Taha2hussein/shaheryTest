//
//  ListPresenter.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
class ListPresenter {
    
    // MARK: - VIPER Stack
    weak var view: (ListPresenterToViewProtocol &  UIViewController)!
    var interactor: ListPresenterToInteractorProtocol!
    var wireframe: ListPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    var productItems :  ListEntitys?
    
    init(wireframe: ListPresenterToWireframeProtocol,
         view: ListPresenterToViewProtocol,
         interactor: ListPresenterToInteractorProtocol) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view as? (ListPresenterToViewProtocol &  UIViewController)
    }
    deinit {
        print("Login presenter has been deintialozed")
    }
}

// MARK: - Interactor to Presenter Protocol
extension ListPresenter: ListInteractorToPresenterProtocol {
    
    func successtoGetProducts(with entity: ListEntitys) {
        self.productItems = entity
        view.reloadTableView()
        view.hideProductLoader()
       
    }
    
    func failedToGetProducts(with error:Error?) {
        if let error = error {
            self.view.showMessage(message: error.localizedDescription.count > 0 ? error.localizedDescription : LocalizedStrings.NoConnection)
        }
        else {
            self.view.showMessage(message: LocalizedStrings.NoConnection)
        }
    }
    
}

// MARK: - View to Presenter Protocol
extension ListPresenter: ListViewToPresenterProtocol {
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func requestProducts(limit:Int) {
        view.showProductLoader()
        interactor.getProductsFromApi(limit: limit)
    }
    
    func getProductListCount() -> Int? {
        return self.productItems?.count
    }
    
    func cellProductItem(indexPath: IndexPath, cell: ListTableViewCell) {
        if  let productItem = getProductItem(indexPath: indexPath){
            cell.configureCell(from: productItem)
        }
    }
    
    func getProductSelected(indexPath:IndexPath) -> ListEntity? {
        if  let productImte = getProductItem(indexPath: indexPath){
        return productImte
        }
        return nil
    }
    
    func getProductItem(indexPath:IndexPath)->ListEntity? {
        if let productItem = self.productItems?[indexPath.row]{
            return productItem
        }
        return nil
    }
    
    func showListViewDetailsAction(itemSelected : ListEntity) {
        wireframe.showListViewDetails(itemSelected: itemSelected)
    }
}

