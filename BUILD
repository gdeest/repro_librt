package(default_visibility = ["//visibility:public"])

load("@io_tweag_rules_haskell//haskell:haskell.bzl",
     "haskell_binary",
     "haskell_doc",
     "haskell_library",
     "haskell_test",
     "haskell_toolchain",
     "haskell_cc_import",
)

# load("//:flags.bzl", "bin_flags")

haskell_toolchain(
    name = "ghc-toolchain",
    version = "8.2.2",
    tools = "@ghc-toolchain//:bin",
)
