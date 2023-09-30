//
//  ImageService.swift
//  WanderLens
//
//  Created by Telem Tobi on 30/09/2023.
//

import UIKit
import SDWebImage

class PhotosService: NSObject {
    
    func saveImage(from url: URL) {
        SDWebImageManager.shared.loadImage(
            with: url,
            options: .continueInBackground,
            progress: nil,
            completed: { [weak self] uiImage, _, _, _, _, _ in
                guard let uiImage else {
                    self?.notifySaveCompleted(success: false)
                    return
                }
                
                self?.saveImage(image: uiImage)
            }
        )
    }
    
    func saveImage(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc private func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        notifySaveCompleted(success: error == nil)
    }
    
    private func notifySaveCompleted(success: Bool) {
        let notification = success ? Constants.Notification.photoSaveSucceeded : Constants.Notification.photoSaveFailed
        NotificationCenter.default.post(name: notification, object: nil)
    }
}
