{-# LANGUAGE OverloadedStrings #-}

import           Data.Monoid                          (mconcat)
import           Network.Wai.Middleware.RequestLogger (logStdoutDev)
import           Web.Scotty

main = scotty 3000 $ do
  middleware logStdoutDev
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat [ "<h1>Scotty, "
                   , beam
                   , " me up!</h1>"
                   ]
