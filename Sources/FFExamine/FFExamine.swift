import ArgumentParser
import Figlet
import Foundation
import ImageIO

@main
struct FFExamine: ParsableCommand {

    @Option(
        help: "Specify the folder path"
    )
    public var input: String = ""

    public func run() throws {
        Figlet
            .say(
                "FFExamine!!!"
            )

        let supportedFormats: Set = [
            //videoFormats
            "mp4", "mov", "m4a", "mkv",
            //audioFormats
            "mp3", "avi", "webm",
            //imageFormats
            "png", "jpeg", "gif",
            // documentFormats
            "pdf",
        ]

        let fileManager = FileManager.default

        do {
            let contentsOfInputDirectry = try fileManager.contentsOfDirectory(
                atPath: input
            )
            for content in contentsOfInputDirectry {
                let computedUrl = URL(
                    fileURLWithPath: input
                )
                .appendingPathComponent(
                    content
                )

                if supportedFormats
                    .contains(
                        computedUrl.pathExtension
                            .lowercased()
                    )
                {
                    do {
                        let sizeOfComputedUrl = try computedUrl.resourceValues(
                            forKeys: [URLResourceKey.fileSizeKey]
                        )
                        print(
                            "\(content) is of size \((sizeOfComputedUrl.fileSize ?? 0) / 1024) KB"
                        )
                        
                        // call a type method that inspects a given url and computes the values to the imageinfo properties and assign it to a constant
                        let imageInfo = ImageInfo.inspectImageUrl(atInputUrl: computedUrl)
                        print(
                            "Image info is as follows:\nColorModel-> \(imageInfo.colorModel)\nDpiHeight-> \(imageInfo.dpiHeight)\nDpiWidth-> \(imageInfo.dpiWidth)\nImageDepth-> \(imageInfo.depth)\nThis image hasAlpha-> \(imageInfo.hasAlpha)\nPixelHeight-> \(imageInfo.pixelHeight)\nPixelWidth-> \(imageInfo.pixelWidth)\nProfileName-> \(imageInfo.profileName)\n"
                        )
                    } catch {
                        print(
                            error
                        )
                    }
                }
            }
        } catch {
            print(
                "Yo wyd. specify the folder path right fucking now"
            )
        }

    }
}
