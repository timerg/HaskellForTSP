{-# LANGUAGE OverloadedStrings #-}

module TSP.Parser where

import TSP.Types
import TSP.Map

import Data.Attoparsec.ByteString.Char8
import Data.ByteString.Char8 (ByteString)
import Data.Scientific (Scientific, coefficient)
import Data.IntMap


parseEdge :: Parser Edge
parseEdge = do
    char '('
    skipSpace
    from <- fromInteger . coefficient <$> scientific
    skipSpace
    char ','
    skipSpace
    to <- fromInteger . coefficient <$>scientific
    skipSpace
    char ')'
    skipSpace
    weight <- fromInteger . coefficient <$>scientific
    skipSpace
    return $ E from to weight

parseFile :: Parser [Edge]
parseFile = do
    scientific
    endOfLine
    many1 parseEdge

parseFile' :: ByteString -> Maybe [Edge]
parseFile' input = case parseOnly parseFile input of
    Left  _      -> Nothing
    Right result -> Just result




