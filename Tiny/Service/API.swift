//
//  API.swift
//  Tiny
//
//  Created by halab on 5/21/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct API {
    
    static func call<T:Decodable>(url : String, method: HTTPMethod, data : Dictionary<String,Any>,
                                  type: T.Type,
                                  successCallback : @escaping(_ responseData: T)->Void,
                                  errorCallback: @escaping(_ errorCode: Int)->Void) {
        
        Alamofire.request(url, method: method, parameters: data, encoding: JSONEncoding.default)
            
            .responseJSON{ response in
                if let jsonValue = response.result.value {
                    print("Response \(jsonValue)")
                    let jsonObject = JSON(jsonValue)
                    let code = jsonObject[ParamKey.CODE].int!
                    if(code != ResponseCode.SUCCESS) {
                        errorCallback(code)
                    } else {
                        let data = jsonObject[ParamKey.DATA]
                        do {
                            let responseData = try JSONDecoder().decode(T.self, from: data.rawData())
                            successCallback(responseData)
                        } catch let jsonError {
                            errorCallback(ResponseCode.PARSE_JSON_ERROR)
                            print("Decode JSON error: \(jsonError)")
                        }
                    }
                }
        }
    }
}
