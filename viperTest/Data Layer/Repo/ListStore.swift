//
//  ListStore.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import Foundation
import RxSwift
import SwiftyJSON
struct ListStore:ListRepositoryProtocol {
    
    private let disposeBag = DisposeBag()
    private let dataTransformer = ListTransformer()
    
    func  getList(withlimit limit:Int)-> Observable<ListEntitys>{
        let listDetails:PublishSubject<ListEntitys> = PublishSubject<ListEntitys>()
              let requestBody = ListRequestEntity(limit: limit)
              let loginRequestObservable:Observable<ListModel> = Client.instance.request(ListAPIRouter.List(body: requestBody))
              loginRequestObservable.subscribe(onNext: { (listResponse) in
                  let reqEnt = self.dataTransformer.transformListResponse(from: listResponse)
                  listDetails.onNext(reqEnt)
              }, onError: { (error) in
                  listDetails.onError(error)
              }).disposed(by: disposeBag)
              return listDetails
    }
    
}
