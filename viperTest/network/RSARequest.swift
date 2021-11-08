import Foundation
import RxSwift
import Alamofire

struct RSARequest {
    
    func makeRequest<T: Codable>(observer:PublishSubject<T>, urlConvertable:URLRequestConvertible)->DataRequest{
        let request = AF.request(urlConvertable).responseJSON(completionHandler:{(response) in
            switch response.result{
            case .success(let value):
                if let resultString = value as? String{
                    RSADecoder().decodeRSAResponse(observer: observer, resultString: resultString)
                }else{
                    observer.onError(APIErrors.EncryptionError)
                    AlertWrapper().showFailEncryption()
                }
                break
            case .failure(let error):
                observer.onError(error)
                break
            }
        })

        return request
    }
    
}
