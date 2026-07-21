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

                switch inputUrl.pathExtension.lowercased() {
                // image formats
                case "png", "jpeg", "gif":
                    provideSize(of: inputUrl, at: content)
                    // call a type method that inspects a given url and computes the values to the imageinfo properties and assign it to a constant
                    let imageInfo = ImageInfo.inspectImageUrl(
                        atInputUrl: inputUrl
                    )
                    let memoryFootPrint = imageInfo.getImageMemoryFootPrint()
                    let inspectionResult = provideInspectionResult(
                        for: imageInfo
                    )
                    print(
                        inspectionResult
                            + "The Memory footprint of this image(which means the exact memory required to hold this image in memory) is \(memoryFootPrint) MB\n"
                    )
                // Video formats
                case "mp4", "mov", "m4a", "mkv":
                    provideSize(of: inputUrl, at: content)
                default:
                    print("Type not currently supported for \(content)\n")
                }
            }
        } catch {
            print(
                "Yo wyd. specify the folder path right fucking now"
            )
        }
    }
}
