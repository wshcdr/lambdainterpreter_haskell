{-# LANGUAGE DeriveDataTypeable #-} --needed for cmdargs
module Settings where

import qualified Data.Map as Map
import System.Console.CmdArgs
import Control.Concurrent.MVar

import Expression

type Environment = Map.Map String Expression

data InteractivityMode = Full | Steps | Interactive

data Arguments = Arguments { filename :: [String]
                           } deriving (Data, Typeable, Show)

defaultArguments :: Arguments
defaultArguments = Arguments { filename = []
                   }

data Settings = Settings 
                { interactivityMode :: InteractivityMode
                , knowNumbers :: Bool
                , environment :: Environment
                , succName :: String
                , clargs :: Arguments
                , interruption :: MVar Bool
                }

defaultSettings :: Settings
defaultSettings = Settings { interactivityMode = Steps
                           , knowNumbers = True
                           , environment = Map.empty
                           , succName = "SUCC"
                           , clargs = defaultArguments
                           --, TODO: interruption not initialized
                           }
