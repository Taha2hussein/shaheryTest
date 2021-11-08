import Foundation
import RxSwift

struct RSADecoder {
    func decodeRSAResponse<T: Codable>(observer: PublishSubject<T>,resultString:String){
        let tag = "RSA".data(using: .utf8)
        guard let tagHard = tag else {
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
            return
        }
        let decodedData = Data(base64Encoded: resultString, options: Data.Base64DecodingOptions.init(rawValue: 0))
        guard let decodedDataHard = decodedData else {
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
            return
        }
        var (decryptedData):Data?
        do{
            (decryptedData,_) = try CC.RSA.decrypt(decodedDataHard, derKey: EncryptionDataStorage.shared.getRSAPrivateKey() , tag: tagHard , padding: .pkcs1, digest: .none)
        }catch{
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
        }
        guard let decryptedDataHard = decryptedData else {
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
            return
        }
        let jsonString = String(data: decryptedDataHard, encoding: .utf8)!
        print("RSA Response JSON \n \(jsonString)")
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        do {
            let response = try decoder.decode(T.self, from: decryptedDataHard)
            observer.onNext(response)
        } catch {
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
            
        }
    }
}
