/**
    Israel Tech Submission
    Author: David Aghassi
    Date: 1/5/2015

    Language: Swift
**/
import Cocoa

/**Variables**/
var str = "set"
var set = "str"


/**Getters**/
func getSet() -> String{
    return set
}


func getStr() -> String{
    return str
}


/**
Function to compare the two strings and return the index
of the first same character
If no character is found, -1 is returned
**/
func compare(var setString: String, var strString: String) -> Int{
    
    //Check for no string in one or both
    if(checkIfEmpty(setString, strString)){
        return -1;
    }
    
    //Gets string with trimmed white spaces.
    /*
        Although any character is allowed to be returned, I don't
        consider whitespace a proper character, which I define as
        numbers, letters, or punctuation
    */
    setString = getSet().stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    strString = getStr().stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    
    var index = smallestString(setString, strString);
    
    //Checks each character in the strings and sees if they are the same
    for var i = 0; i < index; ++i{
        if(Array(strString)[i] == Array(setString)[i]){
            return i
        }
    }
    
    
    return -1
}

/**
Checks if strings passed in are empty
**/
func checkIfEmpty(var one: String, var two: String) -> Bool{
    return (one.isEmpty||two.isEmpty)
}

/**
Returns the length of the smallets string
**/
func smallestString(var one: String, var two: String) ->Int{
    if(countElements(one) < countElements(two)){
        return countElements(one)
    }
    else{
        return countElements(two)
    }
}

compare(str, set)
