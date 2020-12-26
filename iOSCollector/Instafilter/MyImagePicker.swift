//
//  MyImagePicker.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/26.
//

import Foundation
import SwiftUI

//使用 UIViewControllerRepresentable 意味着 ImagePicker 已经是一个 SwiftUI 视图
struct MyImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: MyImagePicker

        init(_ parent: MyImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            // 该view 是在sheetView中打开，调用环境变量的值将该view 关闭
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    // 告诉 SwiftUI 将Coordinator 类 用于MyImagePicker 协调器
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // 包装了 UIKit 的 UIImagePickerController；创建该ImagePicker结构体时，SwiftUI将自动调用其makeUIViewController()方法
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<MyImagePicker>) {

    }
}
