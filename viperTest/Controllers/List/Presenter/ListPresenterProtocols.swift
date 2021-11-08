//
//  ListPresenterProtocols.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
// VIPER Protocol for communication from Interactor -> Presenter
protocol ListInteractorToPresenterProtocol: AnyObject {
 
    func successtoGetProducts(with entity: ListEntitys)
    func failedToGetProducts(with error:Error?)
}

// VIPER Protocol for communication from View -> Presenter
protocol ListViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func requestProducts(limit:Int)
    func getProductListCount()->Int?
    func cellProductItem(indexPath:IndexPath,cell:ListTableViewCell)
    func getProductSelected(indexPath:IndexPath) -> ListEntity?
    func showListViewDetailsAction(itemSelected : ListEntity)
}
