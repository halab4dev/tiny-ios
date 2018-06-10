//
//  ImageService.swift
//  Tiny
//
//  Created by halab on 6/9/18.
//  Copyright © 2018 halab. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

struct ImageService {
    
    /// Load image from URL
    static func loadImage(imageUrl: String, imageView: UIImageView,
                          successCallback : @escaping(_ image: Image, _ uiImageView: UIImageView)->Void) {
        Alamofire.request(imageUrl).responseImage { response in
            if let image = response.result.value {
                print("image downloaded: \(image)")
                successCallback(image, imageView)
            }
        }
    }
}
