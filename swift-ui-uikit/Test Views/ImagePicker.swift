//
//  ImagePicker.swift
//  swift-ui-uikit
//
//  Created by Mike on 30/03/2021.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    class PickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
            
            super.init()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let uiimage = info[.originalImage] as? UIImage else {
                return
            }
            parent.image = uiimage
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?

    typealias UIViewControllerType = UIImagePickerController
    
    func makeCoordinator() -> PickerCoordinator {
        PickerCoordinator(self)
    }
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}
