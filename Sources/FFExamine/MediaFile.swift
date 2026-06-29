//
//  MediaFile.swift
//  FFExamine
//
//  Created by MAC  on 16/06/2026.
//

import Foundation
import ImageIO

enum MediaFile {
    case image(ImageInfo)
}

struct ImageInfo {
    var colorModel: String?
    var dpiHeight: Int?
    var dpiWidth: Int?
    var depth: Int?
    var hasAlpha: Bool?
    var pixelHeight: Int?
    var pixelWidth: Int?
    var profileName: String?
    
    static func inspectImageUrl(atInputUrl computedUrl: URL) -> Self{
        var imageInfo = ImageInfo()
        if let imageSource = CGImageSourceCreateWithURL(
            computedUrl as CFURL,
            nil
        ) {
            if let imageSourceCopyProperties =
                CGImageSourceCopyPropertiesAtIndex(
                    imageSource,
                    0,
                    nil
                )
            {
                if let cpDict = imageSourceCopyProperties
                    as? [String: Any]
                {
                    if let colorModel = cpDict["ColorModel"]
                        as? String
                    {
                        imageInfo.colorModel = colorModel
                    }
                    if let dpiHeight = cpDict["DPIHeight"]
                        as? Int
                    {
                        imageInfo.dpiHeight = dpiHeight
                    }
                    if let dpiWidth = cpDict["DPIWidth"] as? Int
                    {
                        imageInfo.dpiWidth = dpiWidth
                    }
                    if let depth = cpDict["Depth"] as? Int {
                        imageInfo.depth = depth
                    }
                    if let hasAlpha = cpDict["HasAlpha"]
                        as? Bool
                    {
                        imageInfo.hasAlpha = hasAlpha
                    }
                    if let pixelHeight = cpDict["PixelHeight"]
                        as? Int
                    {
                        imageInfo.pixelHeight = pixelHeight
                    }
                    if let pixelWidth = cpDict["PixelWidth"]
                        as? Int
                    {
                        imageInfo.pixelWidth = pixelWidth
                    }
                    if let profileName = cpDict["ProfileName"]
                        as? String
                    {
                        imageInfo.profileName = profileName
                    }
                }
            } else {
                print(
                    "Image source copy propertie are empty"
                )
            }
        } else {
            print(
                "Image source is empty"
            )
        }
        return imageInfo
    }
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
