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
    
    private let urlDetect = "https://jsonplaceholder.typicode.com/todos/1"
    private let urlTrain = ""
    
    func detect(image: UIImage) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        
        Alamofire.upload(imageData, to: urlDetect).responseJSON { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    print(JSON(value))
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
