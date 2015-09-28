import qualified Data.ByteString.Lazy as B
import Network.HTTP.Conduit (simpleHttp)
import System.IO
import Data.Text


stationUrl apiKey x = "https://api.jcdecaux.com/vls/v1/stations/" ++ x ++ "?contract=Paris&apiKey=" ++ apiKey

getJSON :: String -> IO B.ByteString
getJSON jsonURL = simpleHttp jsonURL

main = do

  apiKeyData <- readFile "jcdecaux.key"
  let apiKey = head $ lines $ apiKeyData
  let testStationUrl = stationUrl apiKey "31705"
  getJSON testStationUrl
