import Foundation
import RxSwift

struct AESDecoder {
    func decodeResponse<T: Codable>(observer: PublishSubject<T>,resultString:String){
        let encryptionStorage = EncryptionDataStorage.shared

        guard let IV = encryptionStorage.getAESKey_IV().data(using: .utf8),
            let AESKEY = encryptionStorage.getAESKey().data(using: .utf8),
            let encryptedData = Data(base64Encoded: resultString, options: NSData.Base64DecodingOptions.init(rawValue: 0))
            else {
                observer.onError(APIErrors.EncryptionError)
                AlertWrapper().showFailEncryption()
                return
        }
        var decryptedData:Data?
        do{
            decryptedData = try CC.crypt(.decrypt, blockMode: .cbc, algorithm: .aes, padding: CC.Padding.pkcs7Padding, data: encryptedData, key: AESKEY, iv: IV)
        }catch{
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
            return
        }
        guard let decryptedDataHard = decryptedData else{
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
            return
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        do{
            let responseCodableObject = try decoder.decode(T.self, from: decryptedDataHard)
            responseCodableObject.encodeObject()?.printJson()
            observer.onNext(responseCodableObject)
        }catch {
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
            return
        }
    }
}
