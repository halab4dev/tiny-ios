//
//  UserService.swift
//  Tiny
//
//  Created by halab on 5/12/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct UserService {
    
    static let USERS = "users/"
    
    static func register(email: String, username: String, password: String,
                         successCallback : @escaping(_ loginResponse: LoginResponse)->Void,
                         errorCallback: @escaping(_ errorCode: Int)->Void){
        let requestUrl = ServerAddress.SERVER_ADDRESS + USERS
        let requestData : Dictionary<String,Any> = [
            ParamKey.EMAIL : email,
            ParamKey.USERNAME : username,
            ParamKey.PASSWORD : password
        ]
        API.call(url: requestUrl, method: HTTPMethod.post, data: requestData, type: LoginResponse.self,
                 successCallback: successCallback, errorCallback: errorCallback)
        
//        Alamofire.request(requestUrl, method: .post, parameters: requestData, encoding: JSONEncoding.default)
//            
//            .responseJSON{ response in
//                if let jsonValue = response.result.value {
//                    let jsonObject = JSON(jsonValue)
//                    let code = jsonObject[ParamKey.CODE].int!
//                    if(code != ResponseCode.SUCCESS) {
//                        errorCallback(code)
//                    } else {
//                        let data = jsonObject[ParamKey.DATA]
//                        do {
//                            let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data.rawData())
//                            successCallback(loginResponse)
//                        } catch let jsonError {
//                            print("Decode JSON error: \(jsonError)")
//                        }
//                    }
//                }
//        }
    }
    
}
