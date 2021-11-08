//
//  RootRouter.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//


import Foundation
import UIKit


class RootRouter:Router {
    var alert: UIViewController?
    
    init() {
        if SecurityManager().isDeviceAllowed() {
            runApp()
        } else {
            terminateApp()
        }
    }
    
    func runApp() {

       _ =  ListWireframe(withRoot: true)
    }
    
    func terminateApp() {
        let rootEmptyView = UIViewController()
        rootEmptyView.view.backgroundColor = .black
        self.openAsRootView(using: rootEmptyView)
        AlertWrapper().showFail(message: "Device Is Not Secure To Run Application") {
//            fatalError("Device is Not Secure to Run The Wallet")
            exit(0)
        }
    }
}
