module Main (main) where

import Test.Tasty
import Test.Tasty.HUnit
import GHC.Generics
import Data.Text
import LexoRank.Types.Rank

main :: IO ()
main = do
  defaultMain $ testGroup "Lexorank Tests" [tests]

tests :: TestTree
tests = testGroup "Ranking" $
  [ testCase "Move item to top" testMoveItemToTop
    
  ]

data Item = Item
  { name :: Text
  , rank :: Rank
  }
  deriving stock (Eq, Show, Generic)

instance Ord Item where
  compare a b = compare a.rank b.rank

testMoveItemToTop :: Assertion
testMoveItemToTop = undefined

