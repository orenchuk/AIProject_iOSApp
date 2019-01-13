//
//  ViewController.swift
//  FaceAuth
//
//  Created by Yevhenii Orenchuk on 1/13/19.
//  Copyright © 2019 Yevhenii Orenchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let recServ = FaceRecognitionServer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = #imageLiteral(resourceName: "Taras")
        recServ.detect(image)
    }

}

