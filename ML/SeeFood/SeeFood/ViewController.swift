//
//  ViewController.swift
//  SeeFood
//
//  Created by engin gülek on 22.01.2023.
//

import UIKit
import CoreML
import Vision
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textLabel: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if   let userPickedImage = info[.originalImage] as? UIImage {
            imageView.image = userPickedImage
            // Alınan image Vision ile Core Image görüntüsü anlamına gelen bir CIImage' dönüştüreceğiz
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert CIImage")
            }
            detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true)
        
        // Resmi veri modelli ile karşılaştırmaktadır. Gelen sonuçlardan her zaman ilkini almak daha yararlı olacaktır
    }
    
    func detect(image:CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML Failed")
        }
        
        let request = VNCoreMLRequest(model: model) { (request,error) in
            guard let resutls = request.results as? [VNClassificationObservation] else {
                fatalError("Model faield to process image")
            }
            
            if let firstResult = resutls.first {
                
                if firstResult.identifier.contains("hotdog") {
                    self.textLabel.text = "Hot Dog"
                    
                }else {
                    self.textLabel.text = "Hot Dog Not"
                }
            }
        }
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }catch {
            print(error)
        }
       
    }
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true)
    }
    
}

