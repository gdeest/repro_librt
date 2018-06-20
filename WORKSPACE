workspace(name = "librt_repro")

# Pinned Git commits for HTTP archives.
rules_haskell_rev="9b396efbf8b176cbc5bebc5ef0f5cb86d99944eb"
rules_nixpkgs_rev="2a0547ac6d5645cb17b71c6f1f8c6febd3544027"

http_archive(
    name = "io_tweag_rules_haskell",
    strip_prefix = "rules_haskell-{}".format(rules_haskell_rev),
    urls = ["https://github.com/tweag/rules_haskell/archive/{}.tar.gz".format(rules_haskell_rev)],
)

http_archive(
    name = "io_tweag_rules_nixpkgs",
    strip_prefix = "rules_nixpkgs-{}".format(rules_nixpkgs_rev),
    urls = ["https://github.com/tweag/rules_nixpkgs/archive/{}.tar.gz".format(rules_nixpkgs_rev)],
)

http_archive(
  name = "bazel_skylib",
  strip_prefix = "bazel-skylib-0.2.0",
  urls = ["https://github.com/bazelbuild/bazel-skylib/archive/0.2.0.tar.gz"]
)

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_git_repository", "nixpkgs_package")

nixpkgs_git_repository(
  name = "nixpkgs",
  revision = "6c064e6b1f34a8416f990db0cc617a7195f71588",
)

nixpkgs_package(
  name = "ghc-toolchain",
  # repository = "@nixpkgs",
  nix_file_content = """
let pkgs = import <nixpkgs> {}; 
    nixpkgsSrc = pkgs.fetchFromGitHub {
      owner = "NixOS";
      repo = "nixpkgs";
      sha256 = "1rqzh475xn43phagrr30lb0fd292c1s8as53irihsnd5wcksnbyd";
      rev = "6c064e6b1f34a8416f990db0cc617a7195f71588";
    };

    nixpkgs = import nixpkgsSrc { }; in
nixpkgs.buildEnv {
  name = "nix-env";
  paths = with nixpkgs; [
    (haskell.packages.ghc822.ghcWithPackages (p: with p;
       [ base
         binary
         bytestring
         distributed-closure
         lp-diagrams
       ]
     ))
  ];
}
""",

build_file_content = """
package(default_visibility = ["//visibility:public"])

filegroup(
  name = "bin",
  srcs = glob(["bin/*"]),
)
""",
)

register_toolchains("//:ghc-toolchain")
