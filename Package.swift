import PackageDescription

let package = Package(
    name: "jirautil",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", Version(0,6,0))
    ]
)
