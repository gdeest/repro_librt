{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE StaticPointers #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ScopedTypeVariables #-}

module ProcessCalculus where

import Control.Distributed.Closure
import Control.Distributed.Closure.TH
import Data.ByteString.Lazy
import Data.Binary
import Data.Typeable
import GHC.Generics (Generic)

class  ProcessCalculus p where
  data SendRaw p :: *

data Send p a = Send (SendRaw p) (Closure (a -> ByteString))
  deriving (Generic)

withStatic [d|
  instance (Binary (SendRaw p), Typeable a) => Binary (Send p a)
  |]
