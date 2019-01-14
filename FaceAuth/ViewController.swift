//
//  ViewController.swift
//  FaceAuth
//
//  Created by Yevhenii Orenchuk on 1/13/19.
//  Copyright © 2019 Yevhenii Orenchuk. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    
    let recognizer = FaceRecognitionServer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = #imageLiteral(resourceName: "predict")
        recognizer.detect(image: image) { (result, error) in
            if let name = result {
                print(name)
            }
        }
        
    }

}

