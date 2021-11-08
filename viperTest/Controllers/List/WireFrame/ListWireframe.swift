//
//  ListWireframe.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
class ListWireframe : Router {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!
    weak var previousView: UIViewController!
    var alert: UIViewController?
    
    init() {
        loadView()
    }
    
    init(from view:UIViewController, isPush: Bool = true) {
        self.previousView = view
        loadView()
        showView(isPush: isPush)
    }
    
    init(withRoot isOpenAsRoot:Bool = false) {
        loadView()
        if isOpenAsRoot{
           
                let navigationController = UINavigationController(rootViewController:  self.viewController)
                openAsRootView(using: navigationController)
            }        
        
    }
    
    private func loadView(){
        let storyboard = UIStoryboard(name: ListConstants.storyboardIdentifier, bundle: Bundle(for: ListWireframe.self))
        let view = (storyboard.instantiateViewController(withIdentifier: ListConstants.viewControllerIdentifier) as? ListView)!
        
        viewController = view
        
        let interactor = ListInteractor()
        let presenter = ListPresenter(wireframe: self,
                                      view: view,
                                      interactor: interactor)
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
    
    private func showView(isPush: Bool){
        if isPush {
            if let navigationController = self.previousView?.navigationController{
                navigationController.pushViewController(self.viewController, animated: true)
            } else {
                fatalError("No Navigation Controller")
            }
        } else {
            self.previousView.present(self.viewController, animated: true, completion: nil)
        }
    }
    
    deinit {
        print("Login Wireframe has been deintialozed")
    }
}

// MARK: - Presenter to Wireframe Protocol
extension ListWireframe: ListPresenterToWireframeProtocol {
    func showListViewDetails(itemSelected : ListEntity) {
     
        _ = ListDetailsWireframe(from: self.viewController, isPush: true, product: itemSelected)
    }
}
