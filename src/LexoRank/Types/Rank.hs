{-# LANGUAGE OverloadedStrings #-}
module LexoRank.Types.Rank where

import Data.Text (Text)
import Data.Text.Display
import GHC.Generics

data Rank = Rank
  { bucket :: Word
    -- ^ Bucket
  , major :: Text
    -- ^ Fixed major component
  , minor :: Text
    -- ^ Distinguishing component. Is prefixed by ":".
  }
  deriving stock (Eq, Show, Generic)

instance Display Rank where
  displayBuilder (Rank bucket major minor) = 
    displayBuilder bucket <> "|" <> displayBuilder major <> displayBuilder minor

instance Ord Rank where
  compare a b = compare (display a) (display b)


nextBucket :: Rank -> Rank
nextBucket rank
  | rank.bucket == 2 = rank{bucket = 0}
  | otherwise = rank{bucket = rank.bucket + 1}


previousBucket :: Rank -> Rank
previousBucket rank
  | rank.bucket == 0 = rank{bucket = 2}
  | otherwise = rank{bucket = rank.bucket - 1}
