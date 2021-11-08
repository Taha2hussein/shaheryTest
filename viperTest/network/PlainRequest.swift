import Foundation
import RxSwift
import Alamofire

struct PlainRequest {
    
    func makeRequest<T: Codable>(observer:PublishSubject<T>, urlConvertable:URLRequestConvertible)->DataRequest{
        let request = AF.request(urlConvertable).responseDecodable(completionHandler: {(response: DataResponse<T>) in
            print("Response Body:")
            response.data?.printJson()
            self.checkResponse(response: response, observer: observer)
        })
        
        return request
    }
    
    private func checkResponse<T:Codable>(response: DataResponse<T> , observer:PublishSubject<T>){
        switch response.result {
        case .success(let value):
            reponseSuccess(value: value, observer: observer)
        case .failure(_):
            reponseError(response: response, observer: observer)
        }
    }
    
    private func reponseSuccess<T>(value: T ,observer: PublishSubject<T> ){
        observer.onNext(value)
        observer.onCompleted()
    }
    
    private func reponseError<T:Codable>(response: DataResponse<T> ,observer: PublishSubject<T> ){
        switch response.response?.statusCode{
        case 404:
//            Util.debugMsg("got 404")
            observer.onError(APIErrors.notfount)
        case nil:
//            Util.debugMsg("got NIL")
            //            handelNoConnectionState(observer: observer)
            observer.onError(response.error ?? APIErrors.noConnection)
        default:
//            Util.debugMsg("got Default")
            print("\n\ndefault error\n")
            print("\n\ndefault error\n \(response.response!.statusCode)")
            print("\n\ndefault error\n \(response.result)")
            observer.onError(response.error ?? APIErrors.notfount)
            
        }
    }
}
