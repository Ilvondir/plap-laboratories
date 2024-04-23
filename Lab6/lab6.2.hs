module Main
where

{-
Prelude> :t readFile
readFile :: FilePath -> IO String
Prelude> :t writeFile
writeFile :: FilePath -> String -> IO ()
Prelude> :t FilePath

<interactive>:1:1: Not in scope: data constructor `FilePat
Prelude> :i FilePath
type FilePath = String  -- Defined in `GHC.IO'
Prelude> :m + System.Environment
Prelude System.Environment> :t getArgs
getArgs :: IO [String]
-}
 
import System.Environment
 
main = do
  [f,g] <- getArgs
  s <- readFile f
  writeFile g s
