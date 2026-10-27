# unbundling

Lists Fedora Haskell dependencies that need to be unbundled

Run over a checkout of fedora haskell packages.

## Usage

`$ unbundling --help`

```
unbundling

Usage: unbundling [-s|--sort] [-l|--limit NUM] [-c|--chains NUM]

  List bundled Fedora Haskell deps

Available options:
  -h,--help                Show this help text
  -s,--sort                Order by number of dependent chains
  -l,--limit NUM           Dependent threshold (default 1)
  -c,--chains NUM          Minimal dependent chains (default 1)
```

## Current results (October 2026)

The first dependent is the current bundling package.

`$ cd ~/fedora/haskell/hackage; unbundling -s --chains 2`

```
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
