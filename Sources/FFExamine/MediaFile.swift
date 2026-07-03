//
//  MediaFile.swift
//  FFExamine
//
//  Created by MAC  on 16/06/2026.
//

import Foundation

enum MediaFile {
    case image(ImageInfo)
}

func provideInspectionResult(for media: ImageInfo) -> String {
    var imageData: [String] = ["Image info is as follows:\n"]
    
    let mediaType = MediaFile.image(media)
    
    switch mediaType {
    
    // Returns inspection result for supported Image types
    case let .image(media):
        if let colorModel = media.colorModel {
            imageData.append("ColorModel-> \(colorModel)\n")
        }
        if let dpiHeight = media.dpiHeight {
            imageData.append("Dpiheight-> \(dpiHeight)\n")
        }
        if let dpiWidth = media.dpiWidth {
            imageData.append("DpiWidth-> \(dpiWidth)\n")
        }
        if let depth = media.depth {
            imageData.append("Depth-> \(depth)\n")
        }
        if let hasAlpha = media.hasAlpha {
            imageData.append("Does the image have Alpha-> \(hasAlpha)\n")
        }
        if let pixelHeight = media.pixelHeight {
            imageData.append("PixelHeight-> \(pixelHeight)\n")
        }
        if let pixelWidth = media.pixelWidth {
            imageData.append("PixelWidth-> \(pixelWidth)\n")
        }
        if let profileName = media.profileName {
            imageData.append("ProfileName-> \(profileName)\n")
        }
        
        return imageData.joined(separator: "")
    }
}

func provideSize(of mediaFile: URL, at urlPath: String) {
    do {
        let sizeOfComputedUrl = try mediaFile.resourceValues(
            forKeys: [URLResourceKey.fileSizeKey]
        )
       
        print("\(urlPath) is of size \((sizeOfComputedUrl.fileSize ?? 0) / 1024) KB")
        
    } catch {
        print(
            error
        )
    }
}
