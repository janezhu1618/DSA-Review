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


