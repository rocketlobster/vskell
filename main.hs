import qualified Data.ByteString.Lazy.Char8 as B
import Network.HTTP.Conduit (simpleHttp)
import System.IO
import Data.Text


stationUrl apiKey x = "https://api.jcdecaux.com/vls/v1/stations/" ++ x ++ "?contract=Paris&apiKey=" ++ apiKey

getJSON :: String -> IO B.ByteString
getJSON jsonURL = simpleHttp jsonURL

main = do

  apiKeyData <- readFile "jcdecaux.key"
  let apiKey = Prelude.head $ Prelude.lines $ apiKeyData
  let testStationUrl = stationUrl apiKey "31705"
  result <- getJSON testStationUrl
  B.putStrLn result
