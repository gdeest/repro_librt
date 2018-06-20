package(default_visibility = ["//visibility:public"])

load("@io_tweag_rules_haskell//haskell:haskell.bzl",
     "haskell_binary",
     "haskell_doc",
     "haskell_library",
     "haskell_lint",
     "haskell_test",
     "haskell_toolchain",
     "haskell_cc_import",
)


prebuilt_deps = [
        "base",
        "binary",
        "bytestring",
        "distributed-closure",
        "lp-diagrams",
]

haskell_library(
    name = "process-calculus",
    # srcs = glob(['**/*.hs']),
    srcs = [
      "ProcessCalculus.hs",
    ],
    prebuilt_dependencies = prebuilt_deps,
)

haskell_lint(name = "lint", deps = ["process-calculus"])
