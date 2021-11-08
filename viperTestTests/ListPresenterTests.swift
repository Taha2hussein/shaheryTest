//
//  ListPresenterTests.swift
//  viperTestTests
//
//  Created by A on 08/11/2021.
//

import XCTest
//@testable import viperTestTests
@testable import viperTest

class ListPresenterTests: XCTestCase {
    
    var presenter: ListPresenter!
    var view : ListView!
    var interactor : ListPresenterToInteractorProtocol!
    var ProductsItem  : ListEntitys?
    var wireframe : ListPresenterToWireframeProtocol!
    
    override func setUp() {
//        presenter = ListPresenter(wireframe: wireframe, view: view, interactor: interactor)
//        presenter.view = view
//        presenter.interactor = interactor
//        interactor.presenter = presenter
    }

    func testRequestProducts(){
       
//        ProductsItem = presenter.interactor.getProductsFromApi(limit: 7)
//        print("test",presenter.interactor.getProductsFromApi(limit: 7))
//        guard (ProductsItem?.count ?? 0) > 0 else{return}
//        XCTAssertGreaterThanOrEqual((ProductsItem?.count ?? 0), 1)
    }
    
    func testErrorMessages() {
//        if let error = error {
//            self.view.showMessage(message: error.localizedDescription.count > 0 ? error.localizedDescription : LocalizedStrings.NoConnection)
//        }
//        else {
//            self.view.showMessage(message: LocalizedStrings.NoConnection)
//        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
