// swift-tools-version:5.3

import Foundation
import PackageDescription

let file = "WebRTC-100.4896.1.2.1/WebRTC.xcframework.zip"

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
            url: "https://github.com/kdg-developer/sora-ios-sdk-specs/releases/download/\(file)",
            checksum: "23bad9bdcb84c8bfadf3a412e3db80ae063ef355142a4bfdb838cda1becaf0f7"
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
