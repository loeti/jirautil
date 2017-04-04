import PackageDescription

let package = Package(
    name: "jirautil",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", Version(0,6,0)),
        .Package(url: "https://github.com/czechboy0/Jay.git", majorVersion: 1)
    ]
)
