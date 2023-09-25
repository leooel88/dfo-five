{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use print" #-}
import TestModule.MyPool

endTest :: IO ()
startTest :: String -> IO ()

endTest = putStrLn "==============================="

startTest testName = do
  putStrLn ""
  putStrLn testName
  endTest

main = do
  -- myAreYouHere
  startTest "myAreYouHere"
  putStrLn $ show $ myAreYouHere 0 [] -- Doit renvoyer False
  putStrLn $ show $ myAreYouHere 0 [3, 2, 1, 0] -- Doit renvoyer True
  putStrLn $ show $ myAreYouHere 'a' ['b', 'c', 'd'] -- Doit renvoyer False
  putStrLn $ show $ myAreYouHere "Hello" ["Bonjour", "Hola", "Hello"] -- Doit renvoyer True
  endTest

  -- mySecureDiv
  startTest "mySecureDiv"
  putStrLn $ show $ mySecureDiv 4 2 -- Doit renvoyer Just 2
  putStrLn $ show $ mySecureDiv 5 0 -- Doit renvoyer Nothing
  putStrLn $ show $ mySecureDiv 10 3 -- Doit renvoyer Just 3
  endTest

  -- mySecureAtIndex
  startTest "mySecureAtIndex"
  putStrLn $ show $ mySecureAtIndex [1, 2, 3, 4] (-2) -- Doit renvoyer Nothing
  putStrLn $ show $ mySecureAtIndex [1, 2, 3, 4] 12 -- Doit renvoyer Nothing
  putStrLn $ show $ mySecureAtIndex [1, 2, 3, 4] 0 -- Doit renvoyer 1
  putStrLn $ show $ mySecureAtIndex [1, 2, 3, 4] 2 -- Doit renvoyer 3
  putStrLn $ show $ mySecureAtIndex [1, 2, 3, 4] 3 -- Doit renvoyer 4
  putStrLn $ show $ mySecureAtIndex ['a', 'b', 'c', 'd', 'e'] 3 -- Doit renvoyer 'd'
  endTest

  -- mySecureNext
  startTest "mySecureNext"
  putStrLn $ show $ mySecureNext Nothing -- Doit renvoyer Nothing
  putStrLn $ show $ mySecureNext (Just 41) -- Doit renvoyer Just 42
  putStrLn $ show $ mySecureNext (mySecureDiv 10 2) -- Doit renvoyer Just 6
  putStrLn $ show $ mySecureNext (mySecureDiv 10 0) -- Doit renvoyer Nothing
  endTest

  -- myLookMe
  startTest "myLookMe"
  putStrLn $ show $ myLookMe 3 ([] :: [(Int, Int)]) -- Doit renvoyer Nothing
  putStrLn $ show $ myLookMe 3 ([] :: [(Int, Char)]) -- Doit renvoyer Nothing
  putStrLn $ show $ myLookMe 2 [(1, 'a'), (2, 'b'), (3, 'c')] -- Doit renvoyer Just 'b'
  putStrLn $ show $ myLookMe 'c' [('a', 10), ('b', 20), ('c', 30)] -- Doit renvoyer Just 30
  putStrLn $ show $ myLookMe 2 [(1, 'a'), (3, 'c')] -- Doit renvoyer Just Nothing
  endTest

  -- secureDo
  startTest "secureDo"
  putStrLn $ show $ secureDo (*) (mySecureDiv 10 0) (Just 5) -- Doit renvoyer Nothing
  putStrLn $ show $ secureDo (+) (mySecureDiv 10 5) Nothing -- Doit renvoyer Nothing
  putStrLn $ show $ secureDo div Nothing (mySecureDiv 10 5) -- Doit renvoyer Nothing
  putStrLn $ show $ secureDo (+) (mySecureDiv 10 5) (mySecureAtIndex [1, 2, 3, 4] 3) -- Doit renvoyer Just 6
  putStrLn $ show $ secureDo (++) (Just "a") (Just "b") -- Doit renvoyer Just "ab"
  endTest

  -- printMyBox
  printMyBox 0 -- Ne doit rien faire
  printMyBox 5
  printMyBox 1
  printMyBox 2