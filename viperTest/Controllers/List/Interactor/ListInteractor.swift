//
//  ListInteractor.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
import RxSwift
class ListInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: ListInteractorToPresenterProtocol!
    let disposeBag = DisposeBag()
    
    deinit {
        print("Login interactor has been deintialozed")
    }
}

// MARK: - Presenter To Interactor Protocol
extension ListInteractor: ListPresenterToInteractorProtocol {
     
    func getProductsFromApi(limit:Int) {
        let ListStore = ListStore()
        ListStore.getList(withlimit: limit)
            .subscribe {[weak self] (ListEntitys) in
            self?.presenter?.successtoGetProducts(with: ListEntitys)
        } onError: {[weak self] (error) in
            self?.presenter?.failedToGetProducts(with: error)
        }.disposed(by: disposeBag)
    }
    
}
