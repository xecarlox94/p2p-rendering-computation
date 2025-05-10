module Main where

import P2PRC
  ( runP2PRC
  , MapPortRequest(MkMapPortRequest)
  )

main :: IO ()
main =
  runP2PRC
    ( MkMapPortRequest 8080 "jose.akilan.io"
    )





-- dta Process where
  


{-
data ProcessNetwork a
  = Tree (ProcessNetwork a) (ProcessNetwork a)
  | SingleProcess a

-- establish relationships between processes
-- Distributed application

class Process where
  start       :: () -> Int
  interrupted :: () -> Int
  terminated  :: () -> Int


-- (Network Context) => Process

-- Stream => Process => 


-- data Stream where
  -- Stream :: a -> 
  --
-}
