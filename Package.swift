// swift-tools-version:5.3

import PackageDescription
import Foundation

let file = "WebRTC-95.4638.2.2.1/WebRTC.xcframework.zip"

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
            checksum: "cbc8c943a0b8e9c9482f76dc596d29610684fd45911d3e6ea6c328796c1797bb"),
        .target(
            name: "Sora",
            dependencies: ["WebRTC", "Starscream"],
            path: "Sora",
            exclude: ["Info.plist"],
            resources: [.process("Sora/VideoView.xib")])
    ]
)
