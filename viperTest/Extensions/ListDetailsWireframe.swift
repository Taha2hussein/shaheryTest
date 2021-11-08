//
//  ListDetailsWireframe.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
class ListDetailsWireframe : Router {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!
    weak var previousView: UIViewController!
    var alert: UIViewController?
    private var Product : ListEntity?
    init() {
        loadView()
    }
    
    init(from view:UIViewController, isPush: Bool = true,product:ListEntity) {
        self.previousView = view
        self.Product = product
        loadView()
        showView(isPush: isPush)
    }
    
    init(withRoot isOpenAsRoot:Bool = false) {
        loadView()
        if isOpenAsRoot{
            openAsRootView(using: self.viewController)
        }
        
    }
    
    private func loadView(){
        let storyboard = UIStoryboard(name: ListDetailsConstants.storyboardIdentifier, bundle: Bundle(for: ListDetailsWireframe.self))
        let view = (storyboard.instantiateViewController(withIdentifier: ListDetailsConstants.viewControllerIdentifier) as? ListDetailsView)!
        
        viewController = view
        
        let interactor = ListDetailsInteractor()
        let presenter = ListDetailsPresenter(wireframe: self,
                                                view: view,
                                                interactor: interactor)
        
        presenter.productItem = self.Product
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
}

// MARK: - Presenter to Wireframe Protocol
extension ListDetailsWireframe: ListDetailsPresenterToWireframeProtocol {
    
}
