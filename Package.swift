// swift-tools-version:5.3

import PackageDescription
import Foundation

let file = "WebRTC-94.4606.3.3.1/WebRTC.xcframework.zip"

let package = Package(
    name: "Sora",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "Sora", targets: ["Sora"]),
        .library(name: "WebRTC", targets: ["WebRTC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/daltoniam/Starscream.git", .exact( "3.1.1")),
    ],
    targets: [
        .binaryTarget(
            name: "WebRTC",
            url: "https://github.com/soudegesu/sora-ios-sdk-specs/releases/download/\(file)",
            checksum: "f9b629629d6c5268e67abac87080cac2cbf2f9b0de78ddff4027e19c7e595d11"),
        .target(
            name: "Sora",
            dependencies: ["WebRTC", "Starscream"],
            path: "Sora",
            exclude: ["Info.plist"],
            resources: [.process("Sora/VideoView.xib")])
    ]
)
