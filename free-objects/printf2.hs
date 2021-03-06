{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

printf :: PType r => r
printf = spr []

class PType t where
  spr :: [String] -> t

instance PType String where
  spr xs = unwords xs

instance (Show a, PType r) => PType (a->r) where
  spr xs = (\x -> spr (show x:xs))


main = do
  putStrLn $ printf 1341 "PAD" 3.98
