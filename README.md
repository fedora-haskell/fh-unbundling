# unbundling

Lists Fedora Haskell dependencies that need to be unbundled

Run over a checkout of fedora haskell packages.

## Usage

`$ unbundling --help`

```
unbundling

Usage: unbundling [-s|--sort] [-l|--limit NUM]

  List bundled Fedora Haskell deps

Available options:
  -h,--help                Show this help text
  -s,--sort                Order by number of dependent chains
  -l,--limit NUM           Dependent threshold (default 1)
```

## Current results (October 2026)

The first dependent is the current bundling package.

`$ cd ~/fedora/haskell/hackage; unbundling --sort`

```
- OneTuple ["ghc-aeson","ghc-hledger-lib"]
- character-ps ["ghc-aeson","ghc-attoparsec-aeson"]
- citeproc ["ghc-pandoc","pandoc-cli"]
- hslua-core ["ghc-hslua","ghc-hslua-module-text","pandoc-cli"]
- hslua-marshalling ["ghc-hslua","ghc-hslua-module-text","pandoc-cli"]
- hslua-packaging ["ghc-hslua","ghc-hslua-module-text","pandoc-cli"]
- hslua-typing ["ghc-hslua","pandoc-cli"]
- libyaml ["ghc-yaml","ghc-pandoc"]
- lucid ["ghc-hledger-lib","hledger"]
- recv ["ghc-warp","ghc-warp-tls"]
- skylighting-core ["ghc-skylighting","ghc-pandoc"]
- sop-core ["ghc-generics-sop","ghc-servant","ghc-servant-server","ghc-servant-client-core","ghc-servant-client"]
- splitmix ["ghc-random","ghc-QuickCheck","ghc-hledger-lib"]
- timeit ["ghc-hledger-lib","hledger"]
- typst-symbols ["ghc-texmath","ghc-pandoc"]
- unicode-collation ["ghc-pandoc","pandoc-cli"]
- unicode-data ["ghc-unicode-transforms","ghc-pandoc"]
- vty-crossplatform ["ghc-brick","tart","hledger-ui"]
- yesod-test ["ghc-yesod-static","hledger-web"]
- bimap ["ghc-brick"] ["ghc-what4","ghc-copilot-theorem"]
- boring ["ghc-dec","ghc-singleton-bool"] ["ghc-constraints"]
- doclayout ["ghc-doctemplates","ghc-pandoc","pandoc-cli"] ["ghc-hledger-lib","hledger-ui"]
- easy-file ["ghc-fast-logger"] ["ghc-simple-sendfile"]
- fedora-krb ["fbrnch"] ["cabal-rpm"]
- file-io ["ghc-tar"] ["git-annex"]
- filelock ["stack"] ["Agda"]
- ghc-lib-parser ["ormolu"] ["hlint"]
- githash ["ghc-optparse-simple","stack"] ["hledger","hledger-web","hledger-ui"]
- integer-conversion ["ghc-attoparsec-iso8601"] ["ghc-aeson","ghc-attoparsec-aeson"]
- invariant ["ghc-kan-extensions"] ["Agda"]
- open-browser ["cabal-install"] ["stack"]
- text-conversions ["ghc-doctemplates","ghc-pandoc"] ["ghc-fsnotify"]
- text-iso8601 ["ghc-aeson"] ["ghc-http-api-data"]
- binary-orphans ["ghc-criterion"] ["ghc-bytes"] ["ghc-hoauth2"]
```

Use `--limit 0` to list all bundled deps:

```shellsession
$ unbundling -l0 | wc -l
120
```
