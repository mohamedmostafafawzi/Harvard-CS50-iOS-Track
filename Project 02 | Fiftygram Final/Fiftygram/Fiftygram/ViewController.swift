//
//  ViewController.swift
//  Fiftygram
//
//  Created by Mohamed Mostafa Fawzi on 2/9/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let context = CIContext()
    var original: UIImage?
    
    @IBOutlet weak var sepia: UIButton!
    @IBOutlet weak var noir: UIButton!
    @IBOutlet weak var vintage: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // making the buttons rounded
        sepia.layer.cornerRadius = 4
        noir.layer.cornerRadius = 4
        vintage.layer.cornerRadius = 4
        }
    
    @IBOutlet var imageView: UIImageView!
    
    
    // Choose photo action
    @IBAction func choosePhoto() {
        // Choose photo function using the photo picker
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil )
        }
    }
    
    // Sepia filter
    @IBAction func applySepia(){
        guard original != nil else {
             return
        }
         let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(0.5, forKey: kCIInputIntensityKey)
        display(filter: filter!)
    }
    
    // Noir filter
    @IBAction func applyNoir(){
        guard original != nil else {
             return
        }
         let filter = CIFilter(name: "CIPhotoEffectNoir")
        display(filter: filter!)
    }

    // Vintage filter
    @IBAction func applyVintage(){
        guard original != nil else {
             return
        }
         let filter = CIFilter(name: "CIPhotoEffectProcess")
        display(filter: filter!)
    }
    
    
    // Display function
    func display(filter: CIFilter) {
        filter.setValue(CIImage(image: original!), forKey: kCIInputImageKey)
        let output = filter.outputImage
        imageView.image = UIImage(cgImage: self.context.createCGImage(output!, from: output!.extent )!)
    }
    
    
    // Image picker func
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // dismiss the picker after selecting the photo
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
            original = image
        }
    }


    
}

