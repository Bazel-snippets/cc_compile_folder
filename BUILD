load("@rules_cc//cc:defs.bzl", "cc_library")
load("create_tree_artifact.bzl", "create_tree_artifact")

platform(
    name = "any",
)

create_tree_artifact(
    name = "tree_artifact",
)

cc_library(
    name = "repro",
    srcs = [
        "standalone_source_file.cpp",
        "tree_artifact",
    ],
)
