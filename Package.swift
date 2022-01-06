// swift-tools-version:5.3

import PackageDescription
import Foundation

let file = "WebRTC-97.4692.4.0.1/WebRTC.xcframework.zip"

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
            checksum: "d1185616837fabe2eeef18d410e36c619b8d6f3a41922384b40b2279f95e8bb4"),
        .target(
            name: "Sora",
            dependencies: ["WebRTC", "Starscream"],
            path: "Sora",
            exclude: ["Info.plist"],
            resources: [.process("Sora/VideoView.xib")])
    ]
)
