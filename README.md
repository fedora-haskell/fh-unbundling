# unbundling

Lists Fedora Haskell dependencies that need to be unbundled

Run over a checkout of fedora haskell packages.

## Usage

`$ unbundling --help`

```
unbundling

Usage: unbundling [-s|--sort] [-l|--limit NUM] [-c|--chains NUM] [TOPDIR]

  List bundled Fedora Haskell deps

Available options:
  -h,--help                Show this help text
  -s,--sort                Order by number of dependent chains
  -l,--limit NUM           Dependent threshold (default 1)
  -c,--chains NUM          Minimal dependent chains (default 1)
```

## Current results (October 2026)

The first dependent is the current bundling package
(eg bimap is bundled by ghc-brick).

`$ unbundling -s --chains 2 ~/fedora/haskell/hackage`

```
- bimap : ghc-brick ghc-what4:[ghc-copilot-theorem]
- boring : ghc-dec:[ghc-singleton-bool] ghc-constraints
- doclayout : ghc-doctemplates:[ghc-pandoc,pandoc-cli] ghc-hledger-lib:[hledger-ui]
- easy-file : ghc-fast-logger ghc-simple-sendfile
- fedora-krb : fbrnch cabal-rpm
- filelock : stack Agda
- ghc-lib-parser : ormolu hlint
- githash : ghc-optparse-simple:[stack] hledger:[hledger-web,hledger-ui]
- integer-conversion : ghc-attoparsec-iso8601 ghc-aeson:[ghc-attoparsec-aeson]
- invariant : ghc-kan-extensions Agda
- open-browser : cabal-install stack
- text-conversions : ghc-doctemplates:[ghc-pandoc] ghc-fsnotify
- text-iso8601 : ghc-aeson ghc-http-api-data
- binary-orphans : ghc-criterion ghc-bytes ghc-hoauth2
```

Use `--limit 0` to list all bundled deps:

`$ unbundling -l0 ~/fedora/haskell/hackage | wc -l`

```
123
```

## All bundlings

`$ unbundling -l0 ~/fedora/haskell/hackage`

```
- OneTuple : ghc-aeson:[ghc-hledger-lib]
- aeson-warning-parser : stack
- ansi-terminal-types : ghc-ansi-terminal
- bimap : ghc-brick ghc-what4:[ghc-copilot-theorem]
- binary-instances : ghc-hoauth2
- binary-orphans : ghc-criterion ghc-bytes ghc-hoauth2
- bitvec : ghc-vector-algorithms
- blake3 : git-annex
- boring : ghc-dec:[ghc-singleton-bool] ghc-constraints
- botan-low : git-annex
- cabal-install-solver : cabal-install
- casa-client : stack
- cassava-megaparsec : ghc-hledger-lib
- character-ps : ghc-aeson:[ghc-attoparsec-aeson]
- choice : ormolu
- citeproc : ghc-pandoc:[pandoc-cli]
- commonmark : ghc-pandoc
- commonmark-extensions : ghc-pandoc
- commonmark-pandoc : ghc-pandoc
- companion : stack
- copr-api : fbrnch
- criterion-measurement : ghc-criterion
- crypto-token : ghc-tls-session-manager
- crypton-socks : ghc-crypton-connection
- data-ordlist : darcs
- dense-linear-algebra : ghc-statistics
- deriving-aeson : hlint
- directory-ospath-streaming : ghc-tar
- djot : ghc-pandoc
- doclayout : ghc-doctemplates:[ghc-pandoc,pandoc-cli] ghc-hledger-lib:[hledger-ui]
- easy-file : ghc-fast-logger ghc-simple-sendfile
- encoding : ghc-hledger-lib
- fedora-krb : fbrnch cabal-rpm
- filelock : stack Agda
- generic-data : Agda
- generically : ghc-aeson
- ghc-lib-parser : ormolu hlint
- ghc-lib-parser-ex : hlint
- gi-freetype2 : ghc-gi-harfbuzz
- gi-graphene : ghc-gi-gtk4
- gi-gsk : ghc-gi-gtk4
- githash : ghc-optparse-simple:[stack] hledger:[hledger-web,hledger-ui]
- gridtables : ghc-pandoc
- happy-lib : happy
- heaps : shake
- hi-file-parser : stack
- hpack : stack
- hslua-aeson : ghc-hslua
- hslua-classes : ghc-hslua
- hslua-cli : pandoc-cli
- hslua-core : ghc-hslua:[ghc-hslua-module-text,pandoc-cli]
- hslua-marshalling : ghc-hslua:[ghc-hslua-module-text,pandoc-cli]
- hslua-objectorientation : ghc-hslua
- hslua-packaging : ghc-hslua:[ghc-hslua-module-text,pandoc-cli]
- hslua-typing : ghc-hslua:[pandoc-cli]
- html-entities : cabal-rpm
- http-download : stack
- http-semantics : ghc-http2
- integer-conversion : ghc-attoparsec-iso8601 ghc-aeson:[ghc-attoparsec-aeson]
- invariant : ghc-kan-extensions Agda
- io-streams-haproxy : ghc-snap-server
- ipynb : ghc-pandoc
- jira-wiki-markup : ghc-pandoc
- js-dgtable : shake
- libmagic : git-annex
- libyaml : ghc-yaml:[ghc-pandoc]
- lift-type : ghc-persistent
- lucid : ghc-hledger-lib:[hledger]
- lzma : ghc-lzma-conduit
- murmur-hash : Agda
- mustache : stack
- neat-interpolation : stack
- netlink : xmobar
- network-control : ghc-http2
- newtype-generics : ghc-MemoTrie
- nonempty-containers : Agda
- open-browser : cabal-install stack
- optics-core : ghc-haskell-gi-base
- pandoc-lua-engine : pandoc-cli
- pandoc-server : pandoc-cli
- pantry : stack
- peano : Agda
- persistent-template : stack
- pqueue : Agda
- prettyprinter-compat-ansi-wl-pprint : ghc-ansi-wl-pprint
- process-extras : Agda
- project-template : stack
- puresat : ghc-spdx
- readable : ghc-snap-core
- recv : ghc-warp:[ghc-warp-tls]
- replace-megaparsec : ghc-persistent
- say : fbrnch
- semialign : ghc-aeson
- skylighting-core : ghc-skylighting:[ghc-pandoc]
- skylighting-format-ansi : ghc-skylighting
- skylighting-format-blaze-html : ghc-skylighting
- skylighting-format-context : ghc-skylighting
- skylighting-format-latex : ghc-skylighting
- skylighting-format-typst : ghc-skylighting
- some : ghc-singleton-bool
- sop-core : ghc-generics-sop:[ghc-servant,ghc-servant-server,ghc-servant-client-core,ghc-servant-client]
- splitmix : ghc-random:[ghc-QuickCheck,ghc-hledger-lib]
- string-interpolate : ghc-fsnotify
- tasty-tap : git-annex
- text-ansi : hledger
- text-builder-linear : hledger
- text-conversions : ghc-doctemplates:[ghc-pandoc] ghc-fsnotify
- text-iso8601 : ghc-aeson ghc-http-api-data
- th-env : ormolu
- tidal-core : ghc-tidal
- tidal-link : ghc-tidal
- timeit : ghc-hledger-lib:[hledger]
- timerep : hadolint
- typst : ghc-pandoc
- typst-symbols : ghc-texmath:[ghc-pandoc]
- unicode-collation : ghc-pandoc:[pandoc-cli]
- unicode-data : ghc-unicode-transforms:[ghc-pandoc]
- utility-ht : hledger
- vector-hashtables : Agda
- vector-stream : ghc-vector
- vty-crossplatform : ghc-brick:[tart,hledger-ui]
- witherable : ghc-aeson
- yesod-test : ghc-yesod-static:[hledger-web]
```
