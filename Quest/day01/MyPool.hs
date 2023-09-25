-- Signatures
myNext :: Int -> Int
myAreYouNeg :: Int -> Bool
myMakeMeAbs :: Int -> Int
myWhoAreTheLittle :: Int -> Int -> Int
myWhoAreTheBest :: Int -> Int -> Int
myGroupMe :: a -> b -> (a, b)
myGroupMeMore :: a -> b -> c -> (a, b, c)
myPrems :: (a, b) -> a
myScd :: (a, b) -> b
myChangeMe :: (a, b) -> (b, a)
myBigBrain :: [a] -> a
myCutHead :: [a] -> [a]
myCountMe :: [a] -> Int
myAtIndex :: [a] -> Int -> a
mySlice :: Int -> [a] -> [a]
mySliceRec :: Int -> [a] -> [a] -> [a]
myLetMeGoRec :: Int -> [a] -> [a]
myLetMeGo :: Int -> [a] -> [a]
myAddMe :: [a] -> [a] -> [a]
myUpsideDownRec :: [a] -> [a] -> [a]
myUpsideDown :: [a] -> [a]
myWithoutMe :: [a] -> [a]
myEnd :: [a] -> a
myListZipperRec :: [a] -> [b] -> [(a, b)] -> [(a, b)]
myListZipper :: [a] -> [b] -> [(a, b)]
myApplyEveryRec :: (a -> b) -> [a] -> [b] -> [b]
myApplyEvery :: (a -> b) -> [a] -> [b]
myJustTheTruthRec :: (a -> Bool) -> [a] -> [a] -> [a]
myJustTheTruth :: (a -> Bool) -> [a] -> [a]
mySplitListInTwo :: [a] -> Int -> ([a], [a]) -> ([a], [a])
myBeautifulSort :: (a -> a -> Bool) -> [a] -> [a]
myMergeRec :: (a -> a -> Bool) -> [a] -> [a] -> [a]

-- Fonctions
-- myNext
myNext x = x + 1

-- myAreYouNeg
myAreYouNeg x = x < 0

-- myMakeMeAbs
myMakeMeAbs n = if n >= 0 then n else -n

-- myWhoAreTheLittle
myWhoAreTheLittle x y = if x < y then x else y

-- myWhoAreTheBest
myWhoAreTheBest x y = if x >= y then x else y

-- myGroupMe
myGroupMe x y = (x, y)

-- myGroupMeMore
myGroupMeMore x y z = (x, y, z)

-- myPrems
myPrems (x, _) = x

-- myScd
myScd (_, y) = y

-- myChangeMe
myChangeMe (x, y) = (y, x)

-- myBigBrain
myBigBrain [] = error "La liste est vide."
myBigBrain (x:_) = x

-- myCutHead
myCutHead [] = error "La liste est vide."
myCutHead (_:xs) = xs

-- myCountMe
myCountMe [] = 0
myCountMe (_:xs) = 1 + myCountMe xs

-- myAtIndex
myAtIndex xs n
  | n < 0 = error "L'index est négatif."
  | n >= myCountMe xs = error "L'index est trop grand."
  | n > 0 = myAtIndex (myCutHead xs) (n - 1)
  | otherwise = myBigBrain xs

-- mySliceRec
mySliceRec 0 _ acc = reverse acc
mySliceRec _ [] acc = reverse acc
mySliceRec k (y:ys) acc = mySliceRec (k-1) ys (y : acc)

-- mySlice
mySlice n xs
  | n < 0 = error "L'index est négatif."
  | otherwise = mySliceRec n xs []

-- myLetMeGoRec
myLetMeGoRec _ [] = []
myLetMeGoRec 0 xs = xs
myLetMeGoRec k (y:ys) = myLetMeGo (k - 1) ys

-- myLetMeGo
myLetMeGo n xs
  | n < 0 = error "L'index est négatif."
  | otherwise = myLetMeGoRec n xs

-- myAddMe
myAddMe k [] = k
myAddMe [] k = k
myAddMe (y:ys) k = y:(myAddMe ys k)

-- myUpsideDownRec
myUpsideDownRec [] acc = acc
myUpsideDownRec (y:ys) acc = myUpsideDownRec ys (y:acc)

-- myUpsideDown
myUpsideDown xs = myUpsideDownRec xs []

-- myWithoutMe
myWithoutMe [] = error "La liste est vide."
myWithoutMe [y] = []
myWithoutMe (y:ys) = y : myWithoutMe ys

-- myEnd
myEnd [] = error "La liste est vide."
myEnd [y] = y
myEnd (_:ys) = myEnd ys

-- myListZipperRec
myListZipperRec [] _ acc = acc
myListZipperRec _ [] acc = acc
myListZipperRec (x:xs) (y:ys) acc = myListZipperRec xs ys ((x, y):acc)

-- myListZipper
myListZipper [] _ = []
myListZipper _ [] = []
myListZipper (x:xs) (y:ys) = reverse (myListZipperRec xs ys [(x, y)])

-- myApplyEveryRec
myApplyEveryRec _ [] acc = acc
myApplyEveryRec f (y:ys) acc = myApplyEveryRec f ys (f y : acc)

-- myApplyEvery
myApplyEvery _ [] = []
myApplyEvery f (y:ys) = reverse (myApplyEveryRec f ys [f y])

-- myJustTheTruthRec
myJustTheTruthRec _ [] acc = acc
myJustTheTruthRec p (y:ys) acc
  | p y = myJustTheTruthRec p ys (y:acc)
  | otherwise = myJustTheTruthRec p ys acc

-- myJustTheTruth
myJustTheTruth _ [] = []
myJustTheTruth p (y:ys)
  | p y = reverse (myJustTheTruthRec p ys [y])
  | otherwise = reverse (myJustTheTruthRec p ys [])

-- mySplitListInTwo
mySplitListInTwo [] _ acc = acc
mySplitListInTwo (y:ys) pivot (accLeft, accRight)
  | pivot == 0 = mySplitListInTwo ys 1 (y:accLeft, accRight)
  | otherwise = mySplitListInTwo ys 0 (accLeft, y:accRight)

-- myMergeRec
myMergeRec _ [] ys = ys
myMergeRec _ xs [] = xs
myMergeRec p (x:xs) (y:ys)
  | p x y = x : myMergeRec p xs (y:ys)
  | otherwise = y : myMergeRec p (x:xs) ys

-- myBeautifulSort
myBeautifulSort _ [] = []
myBeautifulSort _ [x] = [x]
myBeautifulSort p ys =
  let (list_left, list_right) = mySplitListInTwo ys 0 ([], []) in
  myMergeRec p (myBeautifulSort p list_left) (myBeautifulSort p list_right)