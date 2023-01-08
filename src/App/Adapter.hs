module App.Adapter where

import App.Domain
import Polysemy
import App.Domain (ApiToken)

runApiManager :: Member (Embed IO) r => ApiToken -> Sem (ApiManager ': r) a -> Sem r a
runApiManager token = interpret $ \case
  FetchCompletion input -> embed $ do
    return $ FetchCompletionOutput "hello"
