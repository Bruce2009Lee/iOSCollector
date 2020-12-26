//
//  ImageSaver.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/26.
//

import UIKit

class MyImageSaver: NSObject {
    
    //定义2个可选变量，变量是函数类型
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
