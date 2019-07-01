import UIKit

var str = "Hello, playground"
let index = str.index(str.endIndex, offsetBy: -1) //0 is the exact position, -1 is going backwards and 1 is going forward.
let pickedCharacter = str[index]
print(pickedCharacter)


var str2 = "Hello, playground"
let startIndex = str2.index(str2.startIndex, offsetBy: 0)
let endIndex = str2.index(str2.startIndex, offsetBy: 4)

let rangeOfChar = str2[startIndex...endIndex]
print(rangeOfChar)

var result = ""
for i in 0..<str.count {
    if i % 2 == 0 { //even
        let index = str.index(str.startIndex, offsetBy: i)
        result += str[index].description
    }
}
print(result)


let testString = " welcome class :D "
let trim = testString.trimmingCharacters(in: CharacterSet.whitespaces)
print(trim) //took away from beginning and end

let myCustomSet = CharacterSet.init(charactersIn: ":D")
//let trim2 = testString.trimmingCharacters(in: myCustomSet)
//print(trim2)

//removing substring
let result2 = String(testString.unicodeScalars.filter{ !myCustomSet.contains($0) })
print("result2 is \(result2)")

for char in testString {
    if char.isLetter && !char.isWhitespace {
        print(char.description, terminator: "")
    }
}


print(" ")
//removeVowels

func removeVowels(input: String) -> String {
    return String(input.unicodeScalars.filter{ !CharacterSet(charactersIn: "aeiouyAEIOUY").contains($0) })
}
print(removeVowels(input: "eyelashes"))




func reverseThis(input: String) -> String {
    var returnStr = ""
    for num in 1...input.count {
        let offset = input.index(input.endIndex, offsetBy: -num)
        returnStr += input[offset].description
    }

    return returnStr
}
print(reverseThis(input: "extensions"))


//Determine if a given string is a palindrome (the same backwards and forwards) ignoring capitalization and punctuation.

let palindrome1 = "Madam I'm Adam" //true
let palindrome2 = "No lava on Avalon. No lava, no Avalon" //true
let palindrome3 = "They're taking the Hobbits to Isengard" //false

func isPalindrome(_ str: String) -> Bool {
    let myCustomCharacterSet = CharacterSet.whitespaces.union(CharacterSet.punctuationCharacters)
    let formmattedString = String(str.unicodeScalars.filter{ !myCustomCharacterSet.contains($0) }).lowercased()
    let reversedString = String(formmattedString.reversed())
    return formmattedString == reversedString
}

print(isPalindrome(palindrome1))
print(isPalindrome(palindrome2))
print(isPalindrome(palindrome3))

//func isPalindrome(_ str: String) -> Bool {
//    let strippedString = str.replacingOccurrences(of: "\\W", with: "", options: .regularExpression, range: nil)
//    let length = strippedString.count
//
//    if length > 1 {
//        return palindrome(strippedString.lowercased(), left: 0, right: length - 1)
//    }
//
//    return false
//}
//
//private func palindrome(_ str: String, left: Int, right: Int) -> Bool {
//    if left >= right {
//        return true
//    }
//
//    let lhs = str[str.index(str.startIndex, offsetBy: left)]
//    let rhs = str[str.index(str.startIndex, offsetBy: right)]
//
//    if lhs != rhs {
//        return false
//    }
//
//    return palindrome(str, left: left + 1, right: right - 1)
//}
////https://github.com/raywenderlich/swift-algorithm-club/tree/master/Palindromes


//Determine if a given string has all the letters in the English alphabet in it .
let pangram1 = "The quick brown fox jumps over the lazy dog"
let pangram2 = "Four square and seven years ago"

public func isPangram(_ str: String) -> Bool {
    let formattedStr = String(str.unicodeScalars.filter{ !CharacterSet.whitespaces.union(CharacterSet.punctuationCharacters).contains($0) }).lowercased()
    let uniqueSet = Set(formattedStr)
    if uniqueSet.count != 26 {
        return false
    } else {
        return true
    }
}
print(isPangram(pangram1))
print(isPangram(pangram2))

//func isPangram(input: String) -> Bool {
//    return Set(input.filter{$0.isLetter}.lowercased()).count == 26
//}



/*Alice wrote a sequence of words in CamelCase as a string of letters, , having the following properties:
It is a concatenation of one or more words consisting of English letters.
All letters in the first word are lowercase.
For each of the subsequent words, the first letter is uppercase and rest of the letters are lowercase.
Given , print the number of words in  on a new line.
 Sample Input
 saveChangesInTheEditor
 Sample Output
 5
*/

public func countNumOfWords(_ str: String) -> Int {
    return str.filter{ $0.isUppercase }.count + 1
}
print(countNumOfWords("saveChangesInTheEditor"))



/*
 Sami's spaceship crashed on Mars! She sends a series of SOS messages to Earth for help.
 Letters in some of the SOS messages are altered by cosmic radiation during transmission. Given the signal received by Earth as a string, , determine how many letters of Sami's SOS have been changed by radiation.
 
 Sample Input
 SOSSPSSQSSOR
 
 Sample Output
 3
 
 Explanation
 Expected signal: SOSSOSSOSSOS
 Recieved signal: SOSSPSSQSSOR
 Difference:          X  X   X
 We print the number of changed letters.
 */

public func checkSOS(_ message: String) -> Int {
    guard message.count % 3 == 0 else { fatalError("string count invalid") }
    var originalMessage = ""
    while originalMessage.count < message.count {
        originalMessage += "SOS"
    }
    var counter = 0
    for i in 0..<message.count {
        let index = message.index(message.startIndex, offsetBy: i)
        if originalMessage[index] != message[index] {
            counter += 1
        }
    }
    return counter
}
let receivedSignal = "SOSSPSSQSSOR"
print(checkSOS(receivedSignal))

//func marsExploration(s: String) -> Int {
//    guard s.count >= 3 else { return 0 }
//    var errorCount = 0
//    var patternCount = 0
//    let pattern = "sos"
//
//    for char in s {
//        let index = pattern.index(pattern.startIndex, offsetBy: patternCount)
//        let testChar = pattern[index]
//        if char.lowercased() != testChar.description { errorCount += 1 }
//        if patternCount == 2 {
//            patternCount = 0
//        } else {
//            patternCount += 1
//        }
//    }
//
//    return errorCount
//}



/*
 Juius Caesar protected his confidential information by encrypting it using a cipher. Caesar's cipher shifts each letter by a number of letters. If the shift takes you past the end of the alphabet, just rotate back to the front of the alphabet. In the case of a rotation by 3, w, x, y and z would map to z, a, b and c. Given a string and rotation, create an ecrypted string
 
 Sample Input
 middle-Outz
 2
 
 Sample Output
 
 okffng-Qwvb
 
*/

let alphabet = "abcdefghijklmnopqrstuvwxyz"
var alphabetDictionary = [String:Int]()
for (index, letter) in alphabet.enumerated() {
    alphabetDictionary[letter.description] = index
}
print(alphabetDictionary)

public func encryptMessage(str: String, byRotation rotation: Int) -> String {
    var encryptedMessage = ""
    for letter in str {
        if letter.isLetter {
            let oldIndex = alphabetDictionary[letter.lowercased().description] ?? 0
            print(oldIndex)
            let newIndex = oldIndex <= 23 ? oldIndex + rotation : oldIndex - 26 + rotation
            let indexToUse = alphabet.index(alphabet.startIndex, offsetBy: newIndex)
            encryptedMessage += letter.isLowercase ? String(alphabet[indexToUse]) : String(alphabet[indexToUse]).uppercased()
        } else {
            encryptedMessage += letter.description
        }
    }
    return encryptedMessage
}

let messageInput = "middle-Outz"
print(encryptMessage(str: messageInput, byRotation: 2))

func removeDupes(string: String) -> String {
    var storageDictionary = [String:Bool]()
    var returnString = ""
    for char in string {
        let charAsString = String(char)
        if storageDictionary[charAsString] == nil {
            storageDictionary[charAsString] = true
            returnString += charAsString
        }
    }
    return returnString
}
print(removeDupes(string: "mississippi"))

func reverseAString(str: String) -> String {
    var returnStr = ""
    for num in 1...str.count {
        let endIndex = str.index(str.endIndex, offsetBy: -num)
        returnStr += String(str[endIndex])
    }
    return returnStr
}
print(reverseAString(str: "hello"))

func anotherWayToReverse(str: String) -> String {
    var returnStr = ""
    for char in str {
        returnStr = "\(char)\(returnStr)"
    }
    return returnStr
}

print(anotherWayToReverse(str: "world"))
