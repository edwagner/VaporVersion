import PackageDescription

let package = Package(
    name: "VaporTest",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 4),
        .Package(url: "https://github.com/qutheory/vapor-mustache.git", majorVersion: 0, minor: 11)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
        "Tests",
    ]
)

