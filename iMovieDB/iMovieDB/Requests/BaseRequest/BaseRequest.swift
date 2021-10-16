//
//  BaseRequest.swift
//  iMovieDB
//
//  Created by Danilo Bias on 15/03/18.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit
import Alamofire

class BaseRequest: NSObject {

    static let timeout: TimeInterval = 7.0
    
//    static let basicHeaders = [
//        "accept-language": "en",
//        "cache-control": "no-cache"
//    ]
    
    static let basicHeaders = [
        "accept-language": "en",
        "cache-control": "no-cache"
    ]
    
    static let headers: HTTPHeaders = HTTPHeaders(basicHeaders)
    
//    static var manager: SessionManager {
//        let manager = Alamofire.SessionManager.default
//        manager.session.configuration.timeoutIntervalForRequest = timeout
//        return manager
//    }
    
    static func get(_ url: String, _ parameters: Dictionary<String, Any>? = nil,  completion: @escaping(Any?) -> Void) {
        AF.request(url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? url, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200..<300).responseJSON { (response) in

//            debugResponse(response: response)
            
            switch response.result{
            case .success:
                completion(response.data)
                break

            case .failure(let error):
                completion(error)
                break
            }
        }
    }

    static func post(_ url: String, parameters: Dictionary<String, Any>? = nil, completion: @escaping(Any?) -> Void) {
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().response { (response) in
            print("POST: \(response.request?.url?.absoluteString ?? "")")

            if let data = response.data {
                completion(data)
            }

            if let error = response.error {
                completion(error)
            }
        }
    }
    
    static func debugResponse(response: AFDataResponse<Any>) {
        print("GET: \(response.request?.url?.absoluteString ?? "")")
        print(response.request ?? "empty request")  // original URL request
        print(response.response ?? "empty response") // HTTP URL response
        print(response.data ?? "empty data")     // server data
        print(response.result )   // result of response serialization
//        print("Error: \(response.result.error)")
    }
}
