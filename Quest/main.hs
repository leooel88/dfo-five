import TestModule.MyPool

endTest :: IO ()
startTest :: String -> IO ()

endTest = putStrLn "==============================="

startTest testName = do
  putStrLn ""
  putStrLn testName
  endTest

main = do
  -- myNext
  let x = 5
  let y = myNext x
  startTest "myNext"
  putStrLn $ "Le successeur de " ++ show x ++ " est " ++ show y
  endTest

  -- myAreYouNeg
  startTest "myAreYouNeg"
  putStrLn $ "myAreYouNeg (-5) == " ++ show (myAreYouNeg (-5)) -- Doit renvoyer True
  putStrLn $ "myAreYouNeg 0 == " ++ show (myAreYouNeg 0) -- Doit renvoyer False
  putStrLn $ "myAreYouNeg 10 == " ++ show (myAreYouNeg 10) -- Doit renvoyer False
  endTest

  -- myMakeMeAbs
  startTest "myMakeMeAbs"
  print $ myMakeMeAbs (-5) -- Doit renvoyer 5
  print $ myMakeMeAbs 5 -- Doit renvoyer 5
  print $ myMakeMeAbs 0 -- Doit renvoyer 0
  endTest

  -- myWhoAreTheLittle
  startTest "myWhoAreTheLittle"
  putStrLn $ show $ myWhoAreTheLittle 1 2 -- Doit renvoyer 1
  putStrLn $ show $ myWhoAreTheLittle (-3) 0 -- Doit renvoyer -3
  putStrLn $ show $ myWhoAreTheLittle 1000 (-1000) -- Doit renvoyer -1000
  putStrLn $ show $ myWhoAreTheLittle 10 10 -- Doit renvoyer 10
  endTest

  -- myWhoAreTheBest
  startTest "myWhoAreTheBest"
  print $ myWhoAreTheBest 2 5 -- Doit renvoyer 5
  print $ myWhoAreTheBest 10 (-3) -- Doit renvoyer 10
  endTest

  -- myGroupMe
  startTest "myGroupMe"
  print $ myGroupMe 1 2 -- Doit renvoyer (1, 2)
  print $ myGroupMe 'a' "b" -- Doit renvoyer ('a', "b")
  endTest

  -- myGroupMeMore
  startTest "myGroupMeMore"
  print $ myGroupMeMore 1 2 3 -- Doit renvoyer (1, 2, 3)
  print $ myGroupMeMore 'a' 'b' 'c' -- Doit renvoyer ('a', 'b', 'c')
  print $ myGroupMeMore 1 'b' 3 -- Doit renvoyer (1, 'b', 3)
  endTest

  -- myPrems
  startTest "myPrems"
  print $ myPrems (1, 2) -- Doit renvoyer 1
  print $ myPrems ("abc", 123) -- Doit renvoyer "abc"
  endTest

  -- myScd
  startTest "myScd"
  print $ myScd (1, 2) -- Doit renvoyer 2
  print $ myScd ('a', 'b') -- Doit renvoyer 'b'
  print $ myScd ("hello", 123) -- Doit renvoyer 123
  endTest

  -- myChangeMe
  startTest "myChangeMe"
  print $ myChangeMe (1, 2) -- Doit renvoyer (2, 1)
  print $ myChangeMe ("a", "b") -- Doit renvoyer ("b", "a")
  print $ myChangeMe (True, False) -- Doit renvoyer (False, True)
  endTest

  -- myBigBrain
  startTest "myBigBrain"
  putStrLn $ show $ myBigBrain [1, 2, 3] -- Doit renvoyer 1
  putStrLn $ show $ myBigBrain ["hello", "world"] -- Doit renvoyer "hello"
  putStrLn $ show $ myBigBrain ['a', 'b', 'c'] -- DOit renvoyer 'a'
  -- putStrLn $ show $ myBigBrain ([] :: [Int]) -- Doit propager une erreur
  endTest

  -- myCutHead
  startTest "myCutHead"
  putStrLn $ show $ myCutHead [1, 2, 3, 4] -- Doit renvoyer [2, 3, 4]
  putStrLn $ show $ myCutHead [1] -- Doit renvoyer []
  -- putStrLn $ show $ myCutHead ([] :: [Int]) -- Doit renvoyer une erreur
  endTest

  -- myCountMe
  startTest "myCountMe"
  putStrLn $ show $ myCountMe [1, 2, 3, 4] -- Doit renvoyer 4
  putStrLn $ show $ myCountMe [] -- Doit renvoyer 0
  putStrLn $ show $ myCountMe ["hello", "world"] -- Doit renvoyer 2
  endTest

  -- myAtIndex
  startTest "myAtIndex"
  let lst = [1, 2, 3, 4, 5]
  print $ myAtIndex lst 0 -- Doit renvoyer 1
  print $ myAtIndex lst 2 -- Doit renvoyer 3
  print $ myAtIndex lst 4 -- Doit renvoyer 5
  -- print $ myAtIndex lst (-1) -- Doit renvoyer error "L'index est négatif."
  -- print $ myAtIndex lst 5 -- Doit renvoyer error "L'index est trop grand.e"
  endTest

  -- mySlice
  startTest "mySlice"
  let lst_2 = [1, 2, 3, 4, 5, 6, 7]
  print $ mySlice 0 ([] :: [Int]) -- Doit renvoyer []
  print $ mySlice 0 lst_2 -- Doit renvoyer []
  print $ mySlice 2 ([] :: [Int]) -- Doit renvoyer []
  print $ mySlice 1 lst_2 -- Doit renvoyer [1]
  print $ mySlice 3 lst_2 --Doit renvoyer [1, 2, 3]
  print $ mySlice 7 lst_2 -- Doit renvoyer [1, 2, 3, 4, 5, 6, 7]
  print $ mySlice 20 lst_2 -- Doit renvoyer [1, 2, 3, 4, 5, 6, 7]
  -- print $ mySlice (-2) lst_2 -- Doit renvoyer error "L'index est négatif."
  endTest

  -- myLetMeGo
  startTest "myLetMeGo"
  print $ myLetMeGo 3 [1, 2, 3, 4, 5] -- Doit renvoyer [4,5]
  print $ myLetMeGo 0 [1, 2, 3] -- Doit renvoyer [1,2,3]
  print $ myLetMeGo 10 [1, 2, 3] -- Doit renvoyer []
  -- print $ myLetMeGo (-2) [1, 2, 3] -- Doit renvoyer error "L'index est négatif."
  endTest

  -- myAddMe
  startTest "myAddMe"
  print $ myAddMe ([] :: [Int]) [] -- Doit renvoyer []
  print $ myAddMe [] [1, 2, 3] -- Doit renvoyer [1, 2, 3]
  print $ myAddMe [1, 2, 3] [] -- Doit renvoyer [1, 2, 3]
  print $ myAddMe [1, 2, 3] [4, 5, 6] -- Doit renvoyer [1, 2, 3, 4, 5, 6]
  endTest

  -- myUpsideDown
  startTest "myUpsideDown"
  print $ myUpsideDown [1, 2, 3, 4] -- Doit renvoyer [4,3,2,1]
  print $ myUpsideDown [5, 6, 7] -- Doit renvoyer [7,6,5]
  print $ myUpsideDown ([] :: [Int]) -- Doit renvoyer []
  endTest

  -- myWithoutMe
  startTest "myWithoutMe"
  print $ myWithoutMe [1, 2, 3, 4] -- Doit renvoyer [1, 2, 3]
  print $ myWithoutMe ["a", "b", "c", "d", "e"] -- Doit renvoyer ["a", "b", "c", "d"]
  print $ myWithoutMe ["hello", "world"] -- Doit renvoyer ["hello"]
  -- print $ myWithoutMe ([] :: [Int]) -- Doit renvoyer error "La liste est vide."
  endTest

  -- myEnd
  startTest "myEnd"
  print $ myEnd [1, 2, 3, 4] -- Doit renvoyer 4
  print $ myEnd ['a', 'b', 'c', 'd', 'e'] -- Doit renvoyer 'e'
  print $ myEnd ["hello", "world"] -- Doit renvoyer "world"
  -- print $ myEnd ([] :: [Int]) -- Doit renvoyer error "La liste est vide."
  endTest

  -- myListZipper
  startTest "myListZipper"
  print $ myListZipper [1, 2, 3] ['a', 'b', 'c'] -- Doit renvoyer [(1, 'a'), (2, 'b'), (3, 'c')]
  print $ myListZipper [1, 2, 3] ['a', 'b'] -- Doit renvoyer [(1, 'a'), (2, 'b')]
  print $ myListZipper [1, 2] ['a', 'b', 'c', 'd'] -- Doit renvoyer [(1, 'a'), (2, 'b')]
  print $ myListZipper ([] :: [Int]) ['a', 'b', 'c'] -- Doit renvoyer []
  print $ myListZipper [1, 2, 3] ([] :: [Int]) -- Doit renvoyer []
  print $ myListZipper ([] :: [Int]) ([] :: [Int]) -- Doit renvoyer []
  endTest

  -- myApplyEvery
  startTest "myApplyEvery"
  print $ myApplyEvery (* 2) [1, 2, 3] -- Doit renvoyer [2, 4, 6]
  print $ myApplyEvery (+ 1) [1, 2, 3] -- Doit renvoyer [2, 3, 4]
  print $ myApplyEvery (\x -> [x, x + 1]) [1, 2, 3] -- Doit renvoyer [[1,2], [2,3], [3,4]]
  print $ myApplyEvery (+ 3) [1, 2, 3] -- Doit renvoyer [4,5,6]
  endTest

  -- myJustTheTruth
  startTest "myJustTheTruth"
  let lst_3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ myJustTheTruth even lst_3 -- Doit renvoyer [2, 4, 6, 8, 10]
  print $ myJustTheTruth odd lst_3  -- Doit renvoyer [1, 3, 5, 7, 9]
  print $ myJustTheTruth (> 2) lst_3 -- Doit renvoyer [6, 7, 8, 9, 10]
  print $ myJustTheTruth (< 0) lst_3 -- Doit renvoyer []
  print $ myJustTheTruth even ([] :: [Int]) -- Doit renvoyer []
  endTest

  -- myBeautifulSort
  startTest "myBeautifulSort"
  print $ myBeautifulSort (<=) [1, 5, 3, 8, 4, 2] -- Doit renvoyer [1, 2, 3, 4, 5, 8]
  print $ myBeautifulSort (>=) [1, 5, 3, 8, 4, 2] -- Doit renvoyer [8, 5, 4, 3, 2, 1]
  print $ myBeautifulSort (\x y -> length x <= length y) ["ab", "a", "abcd", "abc"] -- Doit renvoyer ["a", "ab", "abc", "abcd"]
  print $ myBeautifulSort (\x y -> length x >= length y) ["ab", "a", "abcd", "abc"] -- Doit renvoyer ["abcd", "abc", "ab", "a"]
  print $ myBeautifulSort (<=) ([] :: [Int]) -- Doit renvoyer []
  endTest
