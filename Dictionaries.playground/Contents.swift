import UIKit

/*Dictionaries
 key:value
 key is hashable - gives us a unique string, can't have the duplicate keys
 unsorted and unordered
 */



//Practice Problems
/*Given the dictionary below complete the following:
 
 
 */

let countries = ["England" : "London", "France" : "Paris", "Japan" : "Tokyo", "Germany" : "Berlin", "Denmark" : "Copenhagen"]

if let capitalOfGermany = countries["Germany"] {
    print(capitalOfGermany)
}

for (country,capital) in countries {
    if capital == "Tokyo" {
        print(country)
    }
}


//Given the list below, write a function that returns the frequency of each number in the array

var list = [1, 1, 5, 6, 6, 7, 1]

func frequency(arr: [Int]) -> [Int:Int] {
    var returnDictionary = [Int:Int]()
    for num in arr {
        if let valueExists = returnDictionary[num] {
            returnDictionary[num] = valueExists + 1
        } else {
            returnDictionary[num] = 1
        }
    }
    return returnDictionary
}
print(frequency(arr: list))


/*
 You are given a dictionary code of type [String:String] which has values for all lowercase letters.
 The codedictionary represents a way to encode a message.
 For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz".
 You are also given a message which contains only lowercase letters and spaces.
 Use the code dictionary to encode the message and print it.
 */
var code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]

let hello = "hello world" // "ifmmp xpsme"

func encodeThisString(str: String) -> String {
    var returnStr = ""
    for char in str {
        if char.isLetter {
            if let letterExists = code[String(char)] {
                returnStr += letterExists
            }
        } else {
            returnStr += char.description
        }
    }
    return returnStr
}

print(encodeThisString(str: hello))



/*
 You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys
 “firstName” and “lastName”. Create an array of strings called firstNames that contains only the
 values for “firstName” from each dictionary.
 */

var people: [[String:String]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton"
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie"
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera"
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno"
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen"
    ]
]

//firstNames = ["Calvin","Garry","Leah","Sonja","Noel"]

func getFirstNames(arr: [[String:String]]) -> [String] {
    var returnArr = [String]()
    for person in arr {
        if let firstName = person["firstName"] {
            returnArr.append(firstName)
        }
    }
    return returnArr
}

let firstNames = getFirstNames(arr: people)
print(firstNames)


//You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Find the person with the best score and print his full name.

var peopleScores: [[String:Any]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 23
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]

func findHighestScore(arr: [[String:Any]]) -> String {
    var highestScore = 0
    var highestScorer = ""
    for person in arr {
        if let score = person["score"] as? Int {
            if score > highestScore {
                highestScore = score
                if let firstName = person["firstName"] as? String, let lastName = person["lastName"] as? String {
                    highestScorer = "\(firstName) \(lastName)"
                }
            }
        }
    }
    return highestScorer
}

print(findHighestScore(arr: peopleScores))

assert(findHighestScore(arr: peopleScores) == "Garry Mckenzie")


/*
 You are given an array of integers. Find out the frequency of each one.
 The frequency of a number is the number of times it appears in the array.
 Print the numbers in ascending order followed by their frequency.
 */

var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]

func findFrequency(arr: [Int]) {
    var frequency = [Int:Int]()
    for num in arr {
        if let numberExists = frequency[num] {
            frequency[num] = numberExists + 1
        } else {
            frequency[num] = 1
        }
    }
    var arrOfInt = [Int]()
    for key in frequency.keys {
        arrOfInt.append(key)
    }
    arrOfInt.sort()
    for num in arrOfInt {
        print("\(num) \(frequency[num] ?? 0)")
    }
}
findFrequency(arr: numbers)

