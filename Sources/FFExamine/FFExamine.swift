import ArgumentParser
import Figlet
import Foundation

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
                let inputUrl = URL(
                    fileURLWithPath: input
                )
                .appendingPathComponent(
                    content
                )

                if supportedFormats
                    .contains(
                        inputUrl.pathExtension
                            .lowercased()
                    )
                {
                    provideSize(of: inputUrl, at: content)
                    
                    switch inputUrl.pathExtension.lowercased() {
                    // image formats
                    case "png", "jpeg", "gif":
                        // call a type method that inspects a given url and computes the values to the imageinfo properties and assign it to a constant
                        let imageInfo = ImageInfo.inspectImageUrl(atInputUrl: inputUrl)
                        let memoryFootPrint = imageInfo.getImageMemoryFootPrint()
                        let inspectionResult = provideInspectionResult(for: imageInfo)
                        print(inspectionResult + "The Memory footprint of this image(which means the exact memory required to hold this image in memory) is \(memoryFootPrint) MB\n")
                    default:
                        print("Type not currently supported")
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
