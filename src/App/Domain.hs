module App.Domain where

import Data.Text as T (Text)
import Polysemy (makeSem)

type ApiToken = Text

newtype FetchCompletionInput = FetchCompletionInput
  { prompt :: Text
  } deriving (Eq, Show)

newtype FetchCompletionOutput = FetchCompletionOutput
  { response :: Text
  } deriving (Eq, Show)

data ApiManager m a where
  FetchCompletion :: FetchCompletionInput -> ApiManager m FetchCompletionOutput

makeSem ''ApiManager
