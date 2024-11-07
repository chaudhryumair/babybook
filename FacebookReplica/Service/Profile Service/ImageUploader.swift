//
//  ImageUploader.swift
//  FacebookReplica
//
//  Created by Chaudhry Umair on 14/10/2024.
//

import Foundation
import Firebase
import FirebaseStorage


class ImageUploader{
    
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let fileName = UUID().uuidString
        let storeageRef = Storage.storage().reference(withPath: "/profile_img/\(fileName)")
        do {
            let _ = try await storeageRef.putDataAsync(imageData)
            let url = try await storeageRef.downloadURL()
            return url.absoluteString
        }catch{
            print("failed with error:- \(error.localizedDescription)")
            return nil
        }
        
    }
    
    static func uploadCoverImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let fileName = UUID().uuidString
        let storeageRef = Storage.storage().reference(withPath: "/cover_img/\(fileName)")
        do {
            let _ = try await storeageRef.putDataAsync(imageData)
            let url = try await storeageRef.downloadURL()
            return url.absoluteString
        }catch{
            print("failed with error:- \(error.localizedDescription)")
            return nil
        }
        
    }
}
