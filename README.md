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
  -s,--sort                Order by number of dependents
  -l,--limit NUM           Dependent threshold (default 1)
```

## Current results (October 2026)

The '#' prefix is the current bundling package:

`$ cd ~/fedora/haskell/hackage; unbundling --sort`

```
- OneTuple 2 #ghc-aeson ghc-hledger-lib
- character-ps 2 #ghc-aeson ghc-attoparsec-aeson
- citeproc 2 #ghc-pandoc pandoc-cli
- easy-file 2 #ghc-fast-logger ghc-simple-sendfile
- fedora-krb 2 #fbrnch cabal-rpm
- file-io 2 #ghc-tar git-annex
- filelock 2 #stack Agda
- ghc-lib-parser 2 #ormolu hlint
- hslua-typing 2 #ghc-hslua pandoc-cli
- invariant 2 #ghc-kan-extensions Agda
- libyaml 2 #ghc-yaml ghc-pandoc
- lucid 2 #ghc-hledger-lib hledger
- open-browser 2 #cabal-install stack
- recv 2 #ghc-warp ghc-warp-tls
- skylighting-core 2 #ghc-skylighting ghc-pandoc
- text-iso8601 2 #ghc-aeson ghc-http-api-data
- timeit 2 #ghc-hledger-lib hledger
- typst-symbols 2 #ghc-texmath ghc-pandoc
- unicode-collation 2 #ghc-pandoc pandoc-cli
- unicode-data 2 #ghc-unicode-transforms ghc-pandoc
- yesod-test 2 #hledger-web ghc-yesod-static
- bimap 3 #ghc-brick ghc-copilot-theorem ghc-what4
- binary-orphans 3 #ghc-criterion ghc-bytes ghc-hoauth2
- boring 3 #ghc-dec ghc-constraints ghc-singleton-bool
- hslua-core 3 #ghc-hslua ghc-hslua-module-text pandoc-cli
- hslua-marshalling 3 #ghc-hslua ghc-hslua-module-text pandoc-cli
- hslua-packaging 3 #ghc-hslua ghc-hslua-module-text pandoc-cli
- integer-conversion 3 #ghc-attoparsec-iso8601 ghc-aeson ghc-attoparsec-aeson
- splitmix 3 #ghc-random ghc-QuickCheck ghc-hledger-lib
- text-conversions 3 #ghc-doctemplates ghc-fsnotify ghc-pandoc
- vty-crossplatform 3 #ghc-brick hledger-ui tart
- doclayout 5 #ghc-doctemplates ghc-hledger-lib ghc-pandoc hledger-ui pandoc-cli
- githash 5 #ghc-optparse-simple hledger-ui hledger-web hledger stack
- sop-core 5 #ghc-generics-sop ghc-servant-client-core ghc-servant-client ghc-servant-server ghc-servant
```

Use `--limit 0` to list all bundled deps:

```shellsession
$ unbundling -l0 | wc -l
120
```
