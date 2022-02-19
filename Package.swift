// swift-tools-version:5.3

import Foundation
import PackageDescription

let file = "WebRTC-99.4844.1.0.1/WebRTC.xcframework.zip"

let package = Package(
    name: "Sora",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Sora", targets: ["Sora"]),
        .library(name: "WebRTC", targets: ["WebRTC"]),
    ],
    targets: [
        .binaryTarget(
            name: "WebRTC",
            url: "https://github.com/soudegesu/sora-ios-sdk-specs/releases/download/\(file)",
            checksum: "80d74e2c66818b37d093f928cc17622826e0dbee0113ecbf85fbd4a75e50129f"
        ),
        .target(
            name: "Sora",
            dependencies: ["WebRTC"],
            path: "Sora",
            exclude: ["Info.plist"],
            resources: [.process("VideoView.xib")]
        ),
    ]
)
