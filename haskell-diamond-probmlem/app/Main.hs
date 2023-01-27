{-# LANGUAGE PackageImports #-}
{-# LANGUAGE ImportQualifiedPost #-}

module Main where

import "foo" Data.Tuple.Extra qualified as T12
import "bar" Data.Tuple.Extra qualified as T11

main :: IO ()
main = putStrLn "Hello, Haskell!"
