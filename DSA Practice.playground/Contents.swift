import UIKit

var str = "Hello, playground"

func reverse(string: String) -> String {
//    let stringAsArray = string.map{ String($0) }
//    let reversedArray = stringAsArray.reversed()
//    let returnString = String(reversedArray.flatMap{ String($0) })
    return String(string.reversed())
}
print(reverse(string: str))


func palindromeCheck(string: String) -> Bool {
    return string.lowercased() == String(string.reversed()).lowercased() ? true : false
}
print(palindromeCheck(string: "Racecar"))


func returnGCF(arr: [Int]) -> Int {
    guard arr.count == 2 else { return 0 }
    var returnInt = 0
    let greaterNumber = max(arr[0], arr[1])
    let smallerNumber = greaterNumber == arr[0] ? arr[1] : arr[0]
    for num in 1...greaterNumber {
        if greaterNumber % num == 0 && smallerNumber % num == 0 {
            returnInt = num
        }
    }
    return returnInt
}
print(returnGCF(arr: [12,28]))


func sumAllEvenIndices(arr: [Int]) -> Int {
    var sum = 0
    for num in 0...arr.count where num % 2 == 0 {
        sum += arr[num]
    }
    return sum
}

print(sumAllEvenIndices(arr: [1, 2, 4, 5, 2]))


func reverseNums(numbers: [Int]) -> [Int] {
    return numbers.reversed()
}


print(reverseNums(numbers: [1, 2, 3]))

func fizzBuzz(x: Int) {
    for num in 1...x {
        if num % 15 == 0 {
            print("FizzBuzz")
        } else if num % 3 == 0 {
            print("Fizz")
        } else if num % 5 == 0 {
            print("Buzz")
        } else {
            print(num)
        }
    }
}

fizzBuzz(x: 20)



let testStr = "   how  about     these    whtiespaces ? "
func deleteWhiteSpaces(str: String) -> String {
    var result = ""
    var hasSpace = false
    for char in str {
        if char.isWhitespace {
            if hasSpace {
                continue
            }
            hasSpace = true
        } else {
            hasSpace = false
        }
        result.append(char)
    }
    return result
}
print(deleteWhiteSpaces(str: testStr))


//given a string with multiple words. Write code that returns how many of them are palindromes
let sampleInput = "danaerys dad cat civic bottle"

func totalPalindromes(str: String) -> Int {
    var counter = 0
    let arr = str.components(separatedBy: " ")
    for word in arr {
        if word == String(word.reversed()) {
            counter += 1
        }
    }
    return counter
}
print(totalPalindromes(str: sampleInput))

//find most common name
let names = ["Emma","Olivia","Noah","Liam","Ava","Sophia",
             "Emma","Olivia","James","Liam","Benjamin","Jacob","Emma"]

let result = Dictionary(grouping: names){$0}.mapValues{ $0.count }
print(result)


//change to military time
let testStringTime = "07:05:45PM"
func timeConversion(s: String) -> String {
    var shadowString = s
    shadowString.removeLast()
    let amPm = String(shadowString.removeLast())
    var timeAsArr = shadowString.components(separatedBy: ":")
    var result = ""
    if amPm == "P" {
        let hour = Int(timeAsArr[0]) ?? 0
        if hour < 12 {
            timeAsArr[0] = String(hour + 12)
        }
    } else {
        let hour = Int(timeAsArr[0]) ?? 0
        if hour == 12 {
            timeAsArr[0] = "00"
        }
    }
    result = String(timeAsArr.flatMap{String($0)+":"})
    result.removeLast()
    return result
}
print(timeConversion(s: testStringTime))


//reverse an array in place
var array1 = [12,13,0,11,12,9,8,-1,-3]
func reverseArray(_ arr: inout [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = arr.count-1
    while leftIndex < rightIndex  {
        arr.swapAt(leftIndex, rightIndex)
        leftIndex += 1
        rightIndex -= 1
    }
    return arr
}
print(reverseArray(&array1))


//sort a string but keeping the uppercase in place
let inputStr = "InTrEPid!2" //output "dEIinPrT"
func sortCorrectly(_ str: String) -> String {
    var result = ""
    for char in str {
        if char.isLetter {
            result.append(char)
        }
    }
    return String(result.sorted{ String($0).lowercased() < String($1).lowercased() })
}
print(sortCorrectly(inputStr))


//Hackerrank apples and oranges problem

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    let applesDistance = apples.map{ a + $0 }
    let orangeDistance = oranges.map{ b + $0 }
    var applesCounter = 0
    var orangesCounter = 0
    for apple in applesDistance {
        if apple >= s && apple <= t {
            applesCounter += 1
        }
    }
    for orange in orangeDistance {
        if orange >= s && orange <= t {
            orangesCounter += 1
        }
    }
    print(applesCounter)
    print(orangesCounter)
}

countApplesAndOranges(s: 7, t: 11, a: 5, b: 15, apples: [-2, 2, 1], oranges: [5, -6])


let inputArr2 = [1,2,3,2,1,2,2,2,2,3,1]

func findKthNum(arr: [Int], k: Int) -> Int? {
    let numSet = Set(arr)
    guard k - 1 < numSet.count else { return nil }
    var storageDict = [Int:Int]()
    for num in arr {
        if let numExists = storageDict[num] {
            storageDict[num] = numExists + 1
        } else {
            storageDict[num] = 1
        }
    }
    var storageTuple = [(num: Int, freq: Int)]()
    for (num, freq) in storageDict {
        let newTuple = (num: num, freq: freq)
        storageTuple.append(newTuple)
    }
    storageTuple.sort{ $0.freq > $1.freq }
    print(storageTuple)
    return storageTuple[k-1].num
}



