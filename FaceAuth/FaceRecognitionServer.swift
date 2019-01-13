//
//  FaceRecognitionServer.swift
//  FaceAuth
//
//  Created by Yevhenii Orenchuk on 1/13/19.
//  Copyright © 2019 Yevhenii Orenchuk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FaceRecognitionServer {
    
    private let urlDetect = "http://127.0.0.1:5000/api/detect"
    private let urlTrain = "http://127.0.0.1:5000/api/add-person"
    
    func detect(image: UIImage) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpg")
                
        },
            to: urlDetect,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value {
                            // TO-DO: make return name
                            print(JSON(value))  // JSON parsing action
                        }
                    }
                case .failure(let error):
                    print(error)
                }
        })
        
    }
    
    func train(title: String, images: [UIImage]) {
        
        if title.isEmpty || images.count != 5 { return }
        
        guard let titleData = title.data(using: .utf8) else { return }
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(titleData, withName: "name")
                
                for (n, image) in images.enumerated() {
                    guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
                    multipartFormData.append(imageData, withName: "image\(n+1)", fileName: "image\(n+1).jpg", mimeType: "image/jpg")
                }
        },
            to: urlTrain,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value {
                            // TO-DO: make return name
                            print(JSON(value))  // JSON parsing action
                        }
                    }
                case .failure(let error):
                    print(error)
                }
        })
        
    }
    
}
