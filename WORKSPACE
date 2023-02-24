load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "af87959afe497dc8dfd4c6cb66e1279cb98ccc84284619ebfec27d9c09a903de",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.2.0/bazel-skylib-1.2.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.2.0/bazel-skylib-1.2.0.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

BAZEL_ZIG_CC_VERSION = "v1.0.0"

http_archive(
    name = "bazel-zig-cc",
    sha256 = "1f4a1d1e0f6b3e5aa6e1c225fcb23c032f8849441de97b9a38d6ea37362d28e2",
    strip_prefix = "bazel-zig-cc-{}".format(BAZEL_ZIG_CC_VERSION),
    urls = ["https://git.sr.ht/~motiejus/bazel-zig-cc/archive/{}.tar.gz".format(BAZEL_ZIG_CC_VERSION)],
)

load("@bazel-zig-cc//toolchain:defs.bzl", zig_toolchains = "toolchains")


zig_toolchains(
    host_platform_sha256 = {
        "linux-aarch64": "b759a11993949531c692ccfc3d1a004b14df714a7a3515fe0b5c90c9a7631d61",
        "linux-x86_64": "028dad5189e02b2058679b64df16e854a1c1ca0e6044b334d4f3be6e35544f07",
        "macos-aarch64": "5709c27d581988f50f5e6fd5b69d92707787e803a1d04992e290b764617664e6",
        "macos-x86_64": "88d194adb2f3c1a9edbb4a24d018007d5f827a57d1d26b2d9f3459236da1b7b6",
        "windows-x86_64": "75e510bda108e4d78b89d5d1d09e70ea8595fac7c43b5611f280668881adb09d",
    },
    version = "0.11.0-dev.1638+7199d7c77",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "dd926a88a564a9246713a9c00b35315f54cbd46b31a26d5d8fb264c07045f05d",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "448e37e0dbf61d6fa8f00aaa12d191745e14f07c31cabfa731f0c8e8a4f41b97",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.28.0/bazel-gazelle-v0.28.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.28.0/bazel-gazelle-v0.28.0.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.19.5")

gazelle_dependencies()
