//
//  APIResponse.swift
//  Tiny
//
//  Created by halab on 5/20/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation

struct Response<T:ResponseData>: Decodable {
    
    var code : Int
    var data : T
}
