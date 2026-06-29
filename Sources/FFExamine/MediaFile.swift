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
    var colorModel: String = ""
    var dpiHeight: Int = 0
    var dpiWidth: Int = 0
    var depth: Int = 0
    var hasAlpha: Bool = false
    var pixelHeight: Int = 0
    var pixelWidth: Int = 0
    var profileName: String = ""
    
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
