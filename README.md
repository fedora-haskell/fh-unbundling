# unbundling

Lists Fedora Haskell packages that need to be unbundled

Run over checkouts of fedora haskell packages.

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

```shellsession
$ unbundling --sort
OneTuple #ghc-aeson ghc-hledger-lib
character-ps #ghc-aeson ghc-attoparsec-aeson
citeproc #ghc-pandoc pandoc-cli
easy-file #ghc-fast-logger ghc-simple-sendfile
fedora-krb #fbrnch cabal-rpm
file-io #ghc-tar git-annex
filelock #stack Agda
ghc-lib-parser #ormolu hlint
hslua-typing #ghc-hslua pandoc-cli
invariant #ghc-kan-extensions Agda
libyaml #ghc-yaml ghc-pandoc
lucid #ghc-hledger-lib hledger
open-browser #cabal-install stack
recv #ghc-warp ghc-warp-tls
skylighting-core #ghc-skylighting ghc-pandoc
text-iso8601 #ghc-aeson ghc-http-api-data
timeit #ghc-hledger-lib hledger
typst-symbols #ghc-texmath ghc-pandoc
unicode-collation #ghc-pandoc pandoc-cli
unicode-data #ghc-unicode-transforms ghc-pandoc
yesod-test #hledger-web ghc-yesod-static
bimap #ghc-brick ghc-copilot-theorem ghc-what4
binary-orphans #ghc-criterion ghc-bytes ghc-hoauth2
boring #ghc-dec ghc-constraints ghc-singleton-bool
integer-conversion #ghc-attoparsec-iso8601 ghc-aeson ghc-attoparsec-aeson
splitmix #ghc-random ghc-QuickCheck ghc-hledger-lib
text-conversions #ghc-doctemplates ghc-fsnotify ghc-pandoc
vty-crossplatform #ghc-brick hledger-ui tart
githash #ghc-optparse-simple hledger-ui hledger-web hledger stack
sop-core #ghc-generics-sop ghc-servant-client-core ghc-servant-client ghc-servant-server ghc-servant
doclayout #ghc-doctemplates ghc-hledger-lib ghc-pandoc hledger-ui pandoc-cli pandoc-cli
hslua-packaging #ghc-hslua ghc-hslua-module-text pandoc-cli pandoc-cli pandoc-cli pandoc-cli
hslua-marshalling #ghc-hslua ghc-hslua-module-text pandoc-cli pandoc-cli pandoc-cli pandoc-cli pandoc-cli pandoc-cli
hslua-core #ghc-hslua ghc-hslua-module-text pandoc-cli pandoc-cli pandoc-cli pandoc-cli pandoc-cli pandoc-cli pandoc-cli
```

Use `--limit 0` to list all bundled deps:

```shellsession
$ unbundling -l0 | wc -l
120
```
