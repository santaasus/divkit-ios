// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "DivKit",
  platforms: [
    .iOS(.v11),
  ],
  products: [
    .library(name: "DivKit", targets: ["DivKit"]),
    .library(name: "DivKitExtensions", targets: ["DivKitExtensions"])
  ],
  targets: [
    .target(
      name: "BaseUI",
      dependencies: [
        "BaseTiny",
      ],
      path: "Core/BaseUI"
    ),
    .target(
      name: "Base",
      dependencies: [
        "BaseTiny",
        "BaseUI",
      ],
      path: "Core/Base"
    ),
    .target(
      name: "BaseTiny",
      path: "Core/BaseTiny"
    ),
    .target(
      name: "CommonCore",
      dependencies: [
        "Base",
        "BaseUI",
      ],
      path: "Core/CommonCore"
    ),
    .target(
      name: "Networking",
      dependencies: [
        "Base",
      ],
      path: "Core/Networking"
    ),
    .target(
      name: "DivKit",
      dependencies: [
        "CommonCore",
        "LayoutKit",
        "Networking",
        "Serialization",
        "TemplatesSupport",
      ],
      path: "DivKit",
      exclude: [
        "generator_config.json",
      ]
    ),
    .target(
      name: "DivKitExtensions",
      dependencies: [
        "DivKit",
      ],
      path: "DivKitExtensions"
    ),
    .target(
      name: "LayoutKit",
      dependencies: [
        "CommonCore",
        "LayoutKitInterface",
      ],
      path: "LayoutKit/LayoutKit"
    ),
    .target(
      name: "LayoutKitInterface",
      dependencies: [
        "CommonCore",
      ],
      path: "LayoutKit/Interface"
    ),
    .target(
      name: "Serialization",
      dependencies: [
        "CommonCore",
      ],
      path: "Serialization"
    ),
    .target(
      name: "TemplatesSupport",
      dependencies: [
        "CommonCore",
        "Serialization",
      ],
      path: "TemplatesSupport"
    ),
  ]
)
