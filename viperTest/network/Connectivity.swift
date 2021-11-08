//
//  Connectivity.swift
//  WorkingOnMyAPI
//
//  Created by A on 9/18/19.
//  Copyright © 2019 elbohy. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class Connectivity {
    let isConnectedObservable = BehaviorSubject<Bool>(value: false)
    
    func checkConnectivityState(){
        if ConnectivityHelper.isConnectedToInternet() {
//            print("Yes! internet is available.")
            isConnectedObservable.onNext(true)
//            print(ConnectivityHelper.isConnectedToInternet())
        }else{
//            print("No Connection.")
            isConnectedObservable.onNext(false)
//            print(ConnectivityHelper.isConnectedToInternet())
        }
    }
    
    
}

fileprivate class ConnectivityHelper {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
