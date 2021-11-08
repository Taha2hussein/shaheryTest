import Foundation
import Alamofire

protocol Routerable: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
    var method: HTTPMethod { get }
    var path: String{ get }
    var Parameters: Parameters?{ get }
    
    func compineParams(currentRequestBody:Codable)-> [String:Any]
    
}

extension Routerable{
    func asURLRequest() throws -> URLRequest {
        let url = try AppSettings.MainURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.method = self.method
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpHeaderField.acceptType.rawValue)
        let encoding: ParameterEncoding = {
            switch method{
            case .get:
                return URLEncoding.default
            case .post:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: Parameters)
    }
    
    var method: HTTPMethod{
        switch self {
        
        default: return .get
        }
    }
    
    var path: String{
        switch self {
        default: return AppSettings.normalPath
        }
        
    }
    
    func compineParams(currentRequestBody:Codable)-> [String:Any]{
        var compinedParams = currentRequestBody.asDictionary()
        compinedParams.merge(BaseRequest().asDictionary()) { (current, _)in current }
        return compinedParams
    }
    
    
//    var Parameters: Parameters?{
//        switch self {
//        default:
//            let baseReq = BaseRequest().asDictionary()
////            baseReq.merge(baseReq) { (current, _) in current }
////            print(result)
//            return baseReq
//        }
//    }
    
    
    
}
