import Foundation
import RxSwift
import Alamofire

struct AESEncoder {
    func encode(urlConvertableParam:URLRequestConvertible)->URLRequestConvertible?{
        let encryptionStorage = EncryptionDataStorage.shared
        var urlConvertable = urlConvertableParam
        var requestBodyData:Data?
        do{
            requestBodyData = try urlConvertable.asURLRequest().httpBody
        }catch{
            AlertWrapper().showFailEncryption()
        }
        guard let hardRequestBodyData = requestBodyData ,
            let AESKEY = encryptionStorage.getAESKey().data(using: .utf8) ,
            let IV = encryptionStorage.getAESKey_IV().data(using: .utf8)
            else {AlertWrapper().showFailEncryption(); return nil}
        var encryptedData:Data?
        do {
            encryptedData = try CC.crypt(.encrypt, blockMode: .cbc, algorithm: .aes, padding:CC.Padding.pkcs7Padding, data: hardRequestBodyData , key: AESKEY, iv:IV)
        } catch { AlertWrapper().showFailEncryption() }
        guard let hardEncryptedData = encryptedData else { AlertWrapper().showFailEncryption(); return nil}
        let encryptedBase64String = hardEncryptedData.base64EncodedString()
        let session = encryptionStorage.getAESKeySessionID()
        let index = session.startIndex
        let first16 = session[index..<session.index(session.startIndex,offsetBy:16)]
        let last16 = session[session.index(session.startIndex,offsetBy:16)...]
        let finalString = "\(first16)\(encryptedBase64String)\(last16)"
        do{
            var editedRequest = try urlConvertable.asURLRequest()
            guard let secureURL = URL(string: AppSettings.MainURL+AppSettings.securePath),
                let encryptedRequestBody = finalString.data(using: .utf8)
                else { AlertWrapper().showFailEncryption(); return nil}
            editedRequest.url = secureURL
            editedRequest.httpBody = encryptedRequestBody
            urlConvertable = editedRequest
            return urlConvertable
        }catch{ AlertWrapper().showFailEncryption(); return nil}
    }
}



import Foundation

/*******
 encodable extenstion to return the value of class request as an array of values
 *****/

extension Encodable {
    func asDictionary() -> [String: Any] {
        do{
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                throw NSError()
            }
            return dictionary
        } catch let error {
            print("encoing Error Happened , unable to convert paramteres to dictionary ")
            print(error)
            return ["error":"unabale to convert the paramteres into deictionary"]
        }
    }
    
    func encodeObject()->Data?{
         let jsonEncoder = JSONEncoder()
         let objectEncoded = try? jsonEncoder.encode(self)
         return objectEncoded
     }
    
    
    
}
