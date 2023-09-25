-- Création de Module
module TestModule.MyPool where

-- Partie du code à rendre :
----------------------------
-- Signatures
myAreYouHere :: Eq a => a -> [a] -> Bool
mySecureDiv :: Int -> Int -> Maybe Int
mySecureAtIndex :: [a] -> Int -> Maybe a
mySecureNext :: Maybe Int -> Maybe Int
myLookMe :: Eq a => a -> [(a, b)] -> Maybe b
secureDo :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
printMyBox :: Int -> IO ()
printExtremeLine :: Int -> IO ()
printNormalLine :: Int -> IO ()
printMiddleLines :: Int -> Int -> IO ()

-- Fonctions
-- myAreYouHere
myAreYouHere _ [] = False
myAreYouHere x (y:ys) = (x == y) || myAreYouHere x ys

-- mySecureDiv
mySecureDiv _ 0 = Nothing
mySecureDiv x y = Just (x `div` y)

-- mySecureAtIndex
mySecureAtIndex [] _ = Nothing
mySecureAtIndex (x:xs) y
  | y < 0 = Nothing
  | y == 0 = Just x
  | otherwise = mySecureAtIndex xs (y - 1)

-- mySecureNext
mySecureNext = fmap (+1)

-- myLookMe
myLookMe _ [] = Nothing
myLookMe x ((y, z):ys)
  | x == y = Just z
  | otherwise = myLookMe x ys

-- secureDo
secureDo f (Just x) (Just y) = Just (f x y)
secureDo _ _ _ = Nothing

-- printExtremeLine
printExtremeLine k
  | k > 0 = do
    putStrLn $ "+" ++ replicate ((2 * k) - 2) '-' ++ "+"
  | otherwise = return ()

-- printNormalLine
printNormalLine k
  | k > 0 = do
    putStrLn $ "|" ++ replicate ((2 * k) - 2) ' ' ++ "|"
  | otherwise = return ()

-- printMiddleLines
printMiddleLines k n
  | n > 0 = do
    printNormalLine k
    printMiddleLines k (n - 1)
  | otherwise = return ()

-- printMyBox
printMyBox k
  | k == 1 = do
    putStrLn "++"
  | k > 0 = do
    printExtremeLine k
    printMiddleLines k (k - 2)
    printExtremeLine k
  | otherwise = return ()