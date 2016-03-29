module TSP.Writer where

import TSP.Types
import TSP.BB
import Data.IntMap

serializeList :: [Step] -> String
serializeList [] = ""
serializeList (s:ss) = (show s) ++ "\n" ++ (serializeList ss)

serializeTSPM :: ([Step], TSPState) -> String
serializeTSPM (a, ts) = serializeList a ++ "\n" ++  (show ts)

serializeState ::  TSPState -> String
serializeState ts = "Bound = "++ (show $ bound ts) ++ "\n" ++ (show $ wMap ts)

-- serializeWMap :: WMap -> String
-- serializeWMap wm =


