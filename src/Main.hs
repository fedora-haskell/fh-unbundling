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
  simpleCmdArgs Nothing "unbundling"
  "List bundled Fedora Haskell deps" $
  run
  <$> switchWith 's' "sort" "Order by number of dependents"
  <*> optionalWith auto 'l' "limit" "NUM" "Dependent threshold (default 1)" 1

run :: Bool -> Int -> IO ()
run order limit = do
  specs <- lines <$> shell "ls */*.spec"
  brSpecs <- nubSort <$> concatMapM specBRs specs
  let grps = groupSort brSpecs
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

    printBundle (d,brs) =
      putStrLn $ "-" +-+ stripDep d +-+ show (length brs) +-+ unwords (map present brs)

    stripDep = dropSuffix "-devel" . dropPrefix "ghc-"

    present =
      uncurry (++) . bimap (dropSuffix "BuildRequires:") (takeWhile (/= '/'))
