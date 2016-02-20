{-# LANGUAGE OverloadedStrings #-}

import           Data.Monoid                          (mconcat)
import           Network.Wai.Middleware.RequestLogger (logStdout)
import           Web.Scotty

main = scotty 8080 $ do
  middleware logStdout
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat [ "<h1>Scotty, "
                   , beam
                   , " me up!</h1>"
                   ]
