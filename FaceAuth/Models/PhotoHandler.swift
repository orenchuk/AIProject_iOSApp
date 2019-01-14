//
//  PhotoHandler.swift
//  FaceAuth
//
//  Created by Yevhenii Orenchuk on 1/14/19.
//  Copyright © 2019 Yevhenii Orenchuk. All rights reserved.
//

import UIKit

class PhotoHandler: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    private let viewController: PredictionViewController
    
    init(vc: PredictionViewController) {
        self.viewController = vc
    }
    
    private func photoHandler(sourceType: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let vc = UIImagePickerController()
            vc.sourceType = sourceType
            vc.delegate = self
            self.viewController.present(vc, animated: true)
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            self.photoHandler(sourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.photoHandler(sourceType: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        viewController.present(alert, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let img = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        self.viewController.image = img // Not the best way to solve the problem
    }
}
