//
//  imagePicker.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/20/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import SwiftUI

struct imagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: imagePicker
        
        init(_ parent: imagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    
    }
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context:UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController{
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>)
    {
        
    }
}
