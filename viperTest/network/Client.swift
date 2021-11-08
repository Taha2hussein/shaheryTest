import Foundation
import Alamofire
import RxSwift

class Client{
    static var instance: Client{
        get{
            if(SignletonObject == nil){
                SignletonObject = Client()
            }
            return SignletonObject!
        }
    }
    private let disposeBag = DisposeBag()
    private static var SignletonObject: Client?
    private var urlConvertable: URLRequestConvertible?
    private let sleepIntervals = SleepIntervel()
    private init(){}
    private let connectivteyMessageObservable = PublishSubject<String>()
    private var requestType:requestType = .Plain
    func request<T: Codable> (_ urlConvertable: URLRequestConvertible, with type:requestType = .Plain) -> Observable<T> {
//        #if BETA
//        self.requestType = .Plain
//        #else
        self.requestType = type
//        #endif
        let networkObservable = PublishSubject<T>()
        self.urlConvertable = urlConvertable
        let _ = self.instantioateRequest(observer: networkObservable)
        networkObservable.disposed(by: disposeBag)
        print(urlConvertable.urlRequest?.url)
        return networkObservable.asObservable()
    }
    
    private func instantioateRequest<T: Codable>(observer: PublishSubject<T>) -> DataRequest?{
        print("Request Body:")
        switch requestType {
        case .Plain:
            print("Plain Request")
            (try! urlConvertable!.asURLRequest().httpBody)?.printJson()
            return PlainRequest().makeRequest(observer: observer, urlConvertable: self.urlConvertable!)
        case .RSA:
            print("RSA Request")
            (try! urlConvertable!.asURLRequest().httpBody)?.printJson()
            return RSARequest().makeRequest(observer:observer,urlConvertable:self.urlConvertable!)
        case .AES:
            print("AES Request")
            (try! urlConvertable!.asURLRequest().httpBody)?.printJson()
            return AESRequest().makeRequest(observer: observer, urlConvertableParam: self.urlConvertable!)
            
        }
    }
}


