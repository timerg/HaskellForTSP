{-# LANGUAGE OverloadedStrings #-}

module Main where

import TSP.Types
import TSP.Parser
import TSP.Map

import System.Environment
import Data.Attoparsec.ByteString.Char8
import Data.ByteString.Char8 (pack, readFile)
import Data.IntMap hiding (null, map)
import qualified Data.IntMap as InM (map)
import Data.Either
import Prelude hiding (readFile)
import TSP.BB
import TSP.Writer


run :: String -> IO ()
run path = do
    input <- readFile path
    case parseFile' input of
        Nothing    -> print "parse Failed"
        Just edges -> do
            let karte = buildMap edges
            let karteW = buildWMap edges
            let bbResult = tspB karteW
            let resultLength = tspmLength bbResult
            writeFile "./data/result.txt" $ (show resultLength) ++ ("\n") ++ (serializeTSPM bbResult)
            -- print karteW



test :: IO ()
-- test = run "data/hw1.TSP.txt"
test = run "data/hw1.TSP.txt"

main :: IO ()
main = do
    args <- getArgs
    if null args
        then
            putStrLn "Please supply path"
        else
            run (head args)

