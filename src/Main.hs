-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad.Extra
import Data.Bifunctor (bimap)
import Data.List.Extra
import Data.Maybe
import SimpleCmd
import SimpleCmdArgs

main :: IO ()
main =
  simpleCmdArgs Nothing "unbundle"
  "List bundled Fedora Haskell deps" $
  run
  <$> switchWith 's' "sort" "Order by number of dependents"
  <*> optionalWith auto 'l' "limit" "NUM" "Dependent threshold" 1

run :: Bool -> Int -> IO ()
run order limit = do
  specs <- lines <$> shell "ls */*.spec"
  brSpecs <- sort <$> concatMapM specBRs specs
  let grps = map lump $ groupOnKey fst brSpecs
  mapM_ printBundle $
    (if order then sortOn (length . snd) else id) $
    filter (\(_,bs) -> length bs > limit && any ((== "#BuildRequires:") . fst) bs) grps
  where
    specBRs spec = do
      brs <- cmdLines "grep" ["-e", "BuildRequires:.*ghc-.*-devel", spec]
      return $ mapMaybe (splitBR spec) brs

    splitBR spec br =
      case unsnoc $ words br of
        Just ([bR], dep) -> Just (dep,(bR,spec))
        _ -> Nothing

    lump (dep,brs) = (dep, map snd brs)

    printBundle (d,brs) =
      putStrLn $ stripDep d ++ ' ' : unwords (map present brs)

    stripDep = dropSuffix "-devel" . dropPrefix "ghc-"

    present =
      uncurry (++) . bimap (dropSuffix "BuildRequires:") (takeWhile (/= '/'))
