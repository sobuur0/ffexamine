//
//  ImageInfo.swift
//  FFExamine
//
//  Created by MAC  on 02/07/2026.
//

import Foundation
import ImageIO

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
    
    func getImageMemoryFootPrint() -> Int {
        var imageFootPrint: Int = 0
        
        //convert depth in bits to byte
        let depthInByte = (self.depth ?? 0) / 8
        
        if(self.hasAlpha ?? false) {
            // if the image has alpha it means there are 4 channels(RGBA) and a pixel has 4 multiplied by the depth(in bytes)
            let pixel = 4 * depthInByte
            imageFootPrint =  (self.pixelWidth ?? 0) * (self.pixelHeight ?? 0) * pixel
        }else {
            // if the image does not have an alpha it only contains 3 channels(RGB) and has a pixel of 3 multiplied by the depth(in bytes)
            let pixel = 3 * depthInByte
            imageFootPrint =  (self.pixelWidth ?? 0) * (self.pixelHeight ?? 0) * pixel
        }
        
        let imageFootPrintInMb = imageFootPrint / 1048576
        return imageFootPrintInMb
    }
}
