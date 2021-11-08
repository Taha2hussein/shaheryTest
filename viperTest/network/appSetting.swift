//
//  appSetting.swift
//  viperTest
//
//  Created by mac on 20/01/2021.
//

import Foundation
import Foundation
import UIKit
struct AppSettings {
    private static var settingsFileName: String {
        get{
            #if BETA
                return "BetaInfo"
            #else
                return "Info"
            #endif
        }
    }
    
    private static var AppSettingsDictionaryName = "AppSettings"
    
    static var isDebug:Bool {
        get{
            #if BETA
            print("Is Beta")
            return true
            #else
            print("Is Not Beta")
            return false
            #endif
        }
    }
    
    static var MainURL:String {
        get{
            return AppSettings.getSetting(withKey: "MainURL")
        }
    }
    
    static var webViewURL:String {
        get{
//            let currentLanguage = Language().getCurrent().rawValue
            return AppSettings.getSetting(withKey: "webViewURL")
        }
    }
    
    static var appAcc:String {
        get{
            return AppSettings.getSetting(withKey: "appAcc")
        }
    }
    
    static var appVersion:String {
        get{
            return AppSettings.getSetting(withKey: "appVersion")
        }
    }
    
    static var storeId:String {
        get{
            return AppSettings.getSetting(withKey: "storeId")
        }
    }
    
//    static var isLogoInDrawer:String {
//        get{
//            return AppSettings.getSetting(withKey: "isLogoInDrawer")
//        }
//    }
    
    static var normalPath:String {
        get{
            return AppSettings.getSetting(withKey: "normalPath")
        }
    }
    
    static var securePath:String {
        get{
            return AppSettings.getSetting(withKey: "securePath")
        }
    }
    
    private static func getSetting(withKey key:String)-> String{
        guard let filePath = Bundle.main.path(forResource: AppSettings.settingsFileName, ofType: "plist") else {
            fatalError("Settings file not found")
        }
        guard let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Faild To Retrive Plist")
        }
        
        guard let appSettingsDictionary: [String: Any] = plist.object(forKey: AppSettings.AppSettingsDictionaryName) as? [String: Any] else {
            fatalError("Faild To Get App Settings Dictionary")
        }
        
        guard let value = appSettingsDictionary[key] as? String else {
            fatalError("Faild To Get Value for \(key)")
        }
        return value
    }
    
}
