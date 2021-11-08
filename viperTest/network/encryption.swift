//
//  encryption.swift
//  viperTest
//
//  Created by mac on 20/01/2021.
//

import Foundation
import Foundation

class EncryptionDataStorage {
    private static var instance: EncryptionDataStorage?
    static var shared: EncryptionDataStorage{
        get{
            if let instance = instance {
                return instance
            } else {
                instance = EncryptionDataStorage()
                return instance!
            }
        }
    }
    
    private var publicRSAKey: Data?
    private var privateRSAKey: Data?
    
    private var publicRSAKeyString: String?
    private var privateRSAKeyString: String?
    
    private var AESKEYString: String?
    private var AESKEYIVString: String?
    private var AESKEYSESSIONIDString: String?
    

    private init(){}
    
    func AddRSAKeys(publicKey:Data, privateKey:Data){
        let publicString = SwKeyConvert.PrivateKey.derToPKCS1PEM(publicKey)
        let privateString = SwKeyConvert.PublicKey.derToPKCS1PEM(privateKey)
        
        publicRSAKey = publicKey
        publicRSAKeyString = publicString
        privateRSAKey = privateKey
        privateRSAKeyString = privateString

    }
    
    func getRSAPublicKey()->Data{
        return self.publicRSAKey ?? Data()
    }
    
    func getRSAPrivateKey()->Data{
        return self.privateRSAKey ?? Data()
    }
    
    
    func getRSAPublicKeyString()->String{
        return publicRSAKeyString ?? ""
    }
    
    func getRSAPrivateKeyString()->String{
        return privateRSAKeyString ?? ""
    }
    
    
    func AddAESKey(Key:String){
        self.AESKEYString = Key
    }
    
    func getAESKey()->String{
        return AESKEYString ?? ""
    }

    func AddAESKey_IV(IV:String){
        self.AESKEYIVString = IV
    }
    
    func getAESKey_IV()->String{
        return self.AESKEYIVString ?? ""
    }
    
    func AddAESKeySessionid(sessionID:String){
        self.AESKEYSESSIONIDString = sessionID
    }
    
    func getAESKeySessionID()->String{
        return AESKEYSESSIONIDString ?? ""
    }
}
