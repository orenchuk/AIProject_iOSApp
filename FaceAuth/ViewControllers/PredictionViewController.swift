//
//  PredictionViewController.swift
//  FaceAuth
//
//  Created by Yevhenii Orenchuk on 1/14/19.
//  Copyright © 2019 Yevhenii Orenchuk. All rights reserved.
//

import UIKit

class PredictionViewController: UIViewController {
    
    private var photoHandler: PhotoHandler?
    private var recognizer = FaceRecognitionServer()
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var predictedNameLabel: UILabel!
    @IBOutlet private weak var predictButton: UIButton!
    
    @IBAction private func setPhoto(_ sender: UIBarButtonItem) {
        if photoHandler != nil {
            photoHandler?.showAlert()
        } else {
            print("ERROR")
        }
    }
    
    @IBAction private func predict(_ sender: UIButton) {
        if self.image == nil { print("nil occured with image") }
        recognizer.detect(image: self.image!) { [unowned self] (result, error) in
            if let name = result {
                print(name)
                self.predictedNameLabel.text = name
                self.predictedNameLabel.isHidden = false
            } else {
                print("here")
                print(error?.localizedDescription)
            }
        }
    }
    
    var image: UIImage? = nil {
        didSet {
            imageView.image = image
            predictButton.isHidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoHandler = PhotoHandler(vc: self)
//        predictButton.isHidden = true
        predictedNameLabel.isHidden = true
        predictButton.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
