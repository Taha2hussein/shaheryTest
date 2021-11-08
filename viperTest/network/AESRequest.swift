import Foundation
import RxSwift
import Alamofire

struct AESRequest {
    func makeRequest<T: Codable>(observer:PublishSubject<T>, urlConvertableParam:URLRequestConvertible)->DataRequest?{
        guard let urlConvertable = AESEncoder().encode(urlConvertableParam: urlConvertableParam) else {
            observer.onError(APIErrors.EncryptionError)
            AlertWrapper().showFailEncryption()
            return nil
        }
        let request = AF.request(urlConvertable).responseString(completionHandler: {(response: DataResponse<String>) in
            print("AES Response JSON")
            switch response.result{
            case .success(let result):
                AESDecoder().decodeResponse(observer: observer, resultString: result)
                break
            case .failure(let error):
                observer.onError(error)
            }
        })
        return request
    }
}
