//
//  AlertWrapper.swift
//  viperTest
//
//  Created by mac on 20/01/2021.
//

import Foundation
import Foundation
import UIKit
struct AlertWrapper {
    
    func showSuccess(message: String, afterMsg:(()->Void)? = nil) {
        guard let callBack = afterMsg else {
            _ = SweetAlert().showAlert(NSLocalizedString("success", comment: "success"), subTitle: message, style: .success, buttonTitle: NSLocalizedString("ok", comment: "ok"))
            return
        }
        _ = SweetAlert().showAlert(NSLocalizedString("success", comment: "success"), subTitle: message, style: .success, buttonTitle: NSLocalizedString("ok", comment: "ok")) { (tapped) in
            if tapped {
               callBack()
            }
        }
    }
    
    func showFailEncryption(){
        _ = SweetAlert().showAlert(NSLocalizedString("error", comment: "error"), subTitle: "IOS Internal Error , Please Call Customer Support", style: .error, buttonTitle: NSLocalizedString("ok", comment: "ok"))
    }
    
    func showFail(message: String, afterMsg:(()->Void)? = nil) {
        guard let callBack = afterMsg else {
            _ = SweetAlert().showAlert(NSLocalizedString("error", comment: "error"), subTitle: message, style: .error, buttonTitle: NSLocalizedString("ok", comment: "ok"))
            return
        }
        _ = SweetAlert().showAlert(NSLocalizedString("error", comment: "error"), subTitle: message, style: .error, buttonTitle: NSLocalizedString("ok", comment: "ok")) { (tapped) in
            if tapped {
                callBack()
            }
        }
    }
    
    func showWarning(message: String, afterMsg:(()->Void)? = nil) {
        guard let callBack = afterMsg else {
            _ = SweetAlert().showAlert(NSLocalizedString("Warning", comment: "warning"),
                                       subTitle: message,
                                       style: .warning,
                                       buttonTitle: NSLocalizedString("ok", comment: "ok"),
                                       buttonColor: .red,
                                       otherButtonTitle: NSLocalizedString("cancel", comment: "cancel"),
                                       otherButtonColor: .gray)
            return
        }
        _ = SweetAlert().showAlert(NSLocalizedString("Warning", comment: "warning"),
                                   subTitle: message,
                                   style: .warning,
                                   buttonTitle: NSLocalizedString("ok", comment: "ok"),
                                   buttonColor: .red,
                                   otherButtonTitle: NSLocalizedString("cancel", comment: "cancel"),
                                   otherButtonColor: .gray)
        {(tapped) in
            if tapped {
                callBack()
            }
        }
    }
    
    func showWarningWithOneButton(message: String, afterMsg:(()->Void)? = nil){
        guard let callBack = afterMsg else {
            _ = SweetAlert().showAlert(NSLocalizedString("Warning", comment: "warning"), subTitle: message, style: .warning, buttonTitle: NSLocalizedString("ok", comment: "ok"))
            return
        }
        _ = SweetAlert().showAlert(NSLocalizedString("Warning", comment: "warning"), subTitle: message, style: .warning, buttonTitle: NSLocalizedString("ok", comment: "ok")) { (tapped) in
            if tapped {
                callBack()
            }
        }
    }
    
    func showInfoWithOneButton(message: String, afterMsg:(()->Void)? = nil){
        guard let callBack = afterMsg else {
            _ = SweetAlert().showAlert(NSLocalizedString("Info", comment: "Info"), subTitle: message, style: .warning, buttonTitle: NSLocalizedString("ok", comment: "ok"))
            return
        }
        _ = SweetAlert().showAlert(NSLocalizedString("Info", comment: "Info"), subTitle: message, style: .warning, buttonTitle: NSLocalizedString("ok", comment: "ok")) { (tapped) in
            if tapped {
                callBack()
            }
        }
    }
    
    
    func showLoading(from view:UIViewController)-> UIViewController{
        let alert = UIAlertController(title: nil, message: NSLocalizedString("loading", comment: ""), preferredStyle: .alert)

        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        view.present(alert, animated: true, completion: nil)
        
        return alert
    }
    
    
}
