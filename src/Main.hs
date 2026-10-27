-- SPDX-License-Identifier: BSD-3-Clause

module Main (main) where

import Control.Monad.Extra (concatMapM)
import Data.Bifunctor (second)
import Data.List.Extra (dropPrefix, dropSuffix, groupSort, nubSort, sortOn, unsnoc)
import Data.Maybe (mapMaybe)
import Distribution.RPM.Build.Order (dependencySortParallel)
import SimpleCmd (cmdLines, shell, shell_, (+-+))
import SimpleCmdArgs (auto, optionalWith, simpleCmdArgs, switchWith)
import System.FilePath (takeBaseName, (</>))
import System.IO.Extra (withTempDir)

main :: IO ()
main =
  simpleCmdArgs Nothing "unbundling"
  "List bundled Fedora Haskell deps" $
  run
  <$> switchWith 's' "sort" "Order by number of dependent chains"
  <*> optionalWith auto 'l' "limit" "NUM" "Dependent threshold (default 1)" 1

run :: Bool -> Int -> IO ()
run order limit = do
  specs <- lines <$> shell "ls */*.spec"
  brSpecs <- nubSort <$> concatMapM specBRs specs
  let grps = groupSort brSpecs
      bundled =
        map (second (map takePkg)) .
        filter (\(_,bs) -> length bs > limit && any ((== "#BuildRequires:") . fst) bs) $ grps
  sortBundles <- mapM dependentSort bundled
  mapM_ printBundle $
    (if order then sortOn (length . snd) else id) sortBundles
  where
    specBRs spec = do
      brs <- cmdLines "grep" ["-e", "BuildRequires:.*ghc-.*-devel", spec]
      return $ mapMaybe (splitBR spec) brs

    splitBR spec br =
      case unsnoc $ words br of
        Just ([bR], dep) -> Just (dep,(bR,spec))
        _ -> Nothing

    printBundle (d,sbrs) =
      -- show (length sbrs) +-+
      putStrLn $ "-" +-+ stripDep d +-+ unwords (map show sbrs)

    stripDep = dropSuffix "-devel" . dropPrefix "ghc-"

    takePkg = takeWhile (/= '/') . snd

    dependentSort (d,[]) = return (d,[])
    dependentSort (d,(b:brs)) =
      withTempDir $ \tmp -> do
      bspec <- do
        let specfile = b ++ ".spec"
        shell_ $ "grep -v '%ghc_lib_subpackage.*%{" ++ filter (/= '-') (stripDep d) ++ "}'" +-+ (b </> specfile) +-+ ">" +-+ (tmp </> specfile)
        return $ tmp </> specfile
      srted <- dependencySortParallel $ bspec : brs
      return (d, map takeBaseName <$> srted)
