//
//  SecurityManager.swift
//  Paymob Wallet
//
//  Created by A on 10/26/20.
//  Copyright © 2020 Paymob. All rights reserved.
//

import Foundation
import UIKit

struct SecurityManager {
 
    init() {
        
    }
    
    func isDeviceAllowed() -> Bool {
        return !(isDeviceJailbroken() || isJailBroken() || canWriteOutsideSandbox())
    }
    
    
    private func isDeviceJailbroken() -> Bool {
        #if arch(i386) || arch(x86_64)
        return false
        #else
        let fileManager = FileManager.default
        
        if (fileManager.fileExists(atPath: "/bin/bash") ||
            fileManager.fileExists(atPath: "/usr/sbin/sshd") ||
            fileManager.fileExists(atPath: "/etc/apt")) ||
            fileManager.fileExists(atPath: "/private/var/lib/apt/") ||
            fileManager.fileExists(atPath: "/Applications/Cydia.app") ||
            fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") {
            return true
        } else {
            return false
        }
        #endif
    }
    
    private func isJailBroken() -> Bool {
        #if arch(i386) || arch(x86_64)
        return false
        #else
        // Check 1 : existence of files that are common for jailbroken devices
        if FileManager.default.fileExists(atPath: "/Applications/Cydia.app")
            || FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib")
            || FileManager.default.fileExists(atPath: "/bin/bash")
            || FileManager.default.fileExists(atPath: "/usr/sbin/sshd")
            || FileManager.default.fileExists(atPath: "/etc/apt")
            || FileManager.default.fileExists(atPath: "/private/var/lib/apt/")
            || FileManager.default.fileExists(atPath: "/Library/PreferenceLoader/Preferences/LibertyPref.plist")
            || FileManager.default.fileExists(atPath: "/Library/PreferenceBundles/LibertyPref.bundle")
            || FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/DynamicLibraries/LibertySB.dylib")
            || FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/DynamicLibraries/LibertySB.plist")
            || FileManager.default.fileExists(atPath: "/usr/lib/Liberty.dylib")
            || FileManager.default.fileExists(atPath: "/Applications/lib/cydia")
            || FileManager.default.fileExists(atPath: "/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist")
            || FileManager.default.fileExists(atPath: "/Library/Frameworks/CydiaSubstrate.framework")
            || FileManager.default.fileExists(atPath: "/private/var/tmp/cydia.log")
            || FileManager.default.fileExists(atPath: "/.cydia_no_stash")
//            || UIApplication.shared.canOpenURL(URL(string: "cydia://package/com.example.package")!)
        {
            return true
        } else {
            return false
        }
        #endif
    }
    
    private func canWriteOutsideSandbox() -> Bool {
        let stringToWrite = "Jailbreak Test"
        do {
            try stringToWrite.write(toFile: "/private/JailbreakTest.txt", atomically:true, encoding:String.Encoding.utf8)
            return true
        } catch {
            return false
        }
    }
    
}
