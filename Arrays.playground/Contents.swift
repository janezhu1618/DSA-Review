import UIKit

var myTestArray = [3,4,5,6,7]
myTestArray[0] //this is subscripting
myTestArray.insert(10, at: 0) //be careful with range
print(myTestArray)

//Array Slices
let mySlice = myTestArray[3...4]
print(mySlice) //ArraySlice carries over the old index to access 5, we need to access it at index 3
//To fix that problem, wrap it around an array Array(myTestArray[3...4]) and now the indexes are reset.

let mySuffixSlice = myTestArray.suffix(2) //length = 2 how many characters to go
print(mySuffixSlice)

let myNumberArray = ["alan","rina"]
let customArray = Array(repeating: 3, count: 6)
print(customArray)

let matrix = Array(repeating: Array(repeating: 0, count: 5), count: 5)

//constant time
func doesThing(number: Int) {
    let array = [2,3,4] //always 3
    for number in array {
        print(number)
    }
}


var numbersArray = [2,3,5,6]
var secondNumberArray = numbersArray
secondNumberArray[0] += 1
print(numbersArray)
print(secondNumberArray)

class myObject {
    var index: Int
    init(index: Int) {
        self.index = index
    }
}

var first = myObject(index: 8)
var second = myObject(index: 3)

var myObjectArray = [first, second]
var mySeconArray = myObjectArray

mySeconArray[0].index = 9000
print(mySeconArray[0].index)
print(myObjectArray[0].index) //arrays are value types until they are from a class

var test = [87,45,6,34,90]
test.swapAt(2, 4)
print(test)

test.reverse() //does the action to the array itself
print(test)

//test.reversed() //gets you what the string would look like if you reversed it


//find the second largest num in an array
let input = [4,2,3,4,3]
func findSecondLargest(arr: [Int]) -> Int {
    var largestNum = 0
    var sln = 0
    for i in arr {
        if i > largestNum {
            sln = largestNum
            largestNum = i
        } else if i > sln && i != largestNum {
            sln = i
        }
    }
    return sln
}
print(findSecondLargest(arr: input))

//find repeating nums
//func repeatingNums(arr: [Int]) -> [Int] {
//    var returnArr = [Int]()
//    for num in arr {
//        if (arr.filter{ $0 == num }).count > 1 && !returnArr.contains(num) {
//            returnArr.append(num)
//        }
//    }
//    return returnArr
//}
func repeatingNums(arr: [Int]) -> [Int] {
    var returnArr = [Int]()
    for num in arr {
        var storageArr = [Int]()
        for num2 in arr {
            if num == num2 {
                print(num)
                storageArr.append(num)
            }
        }
        storageArr.append(num)
        if storageArr.count > 2 && !returnArr.contains(num) {
            returnArr.append(num)
        }
    }
    return returnArr
}
let input2 = [2,2,4,5,5,7]
print(repeatingNums(arr: input2))

//Find the sum of the diagonals of a square, two-dimensional array of Ints

func findDiagonalSum(matrix: [[Int]]) -> Int {
//    guard matrix.count == matrix[0].count else { return 0 }
    var sum = 0
    let matrixDimension = matrix.count
    for i in 0..<matrixDimension {
        for j in 0..<matrixDimension {
            if i == j {
                sum += matrix[i][j]
            }
            if i + j == (matrixDimension-1) {
                sum += matrix[i][j]
            }
        }
    }
    return sum
}

let sampleMatrix = [[1,2,9],[8,2,3],[4,5,6]]
print(findDiagonalSum(matrix: sampleMatrix))



//Find the sum of the first five even numbers in an array of Ints.

let sampleInput = [3,7,-3,2,9,4,8,10,3,9,4,9,8,6,-2]
func sumFirstFiveEven(arr: [Int]) -> Int {
    var storageArr = [Int]()
    for num in arr where num % 2 == 0 {
        storageArr.append(num)
    }
    print(storageArr)
    guard storageArr.count > 5 else { return storageArr.reduce(0, +) }
    let slicedArr = Array(storageArr[0...4])
    return slicedArr.reduce(0, +)
}
print(sumFirstFiveEven(arr: sampleInput))


//Given a square, two dimensional array of Ints, find the row or column that has the greatest sum. If more than one row or column are tied, return all of them.

//func findGreatSum(matrix: [[Int]]) -> String {
//    var greatestSum = 0
//    var indexOfRow = 0
//    var indexOfColumn = 0
//    for (index, i) in matrix.enumerated() {
//        for j in i {
//            let sumOfRow = i.reduce(0, +)
//            if sumOfRow > greatestSum {
//                greatestSum = sumOfRow
//                indexOfRow = index
//            }
//
//        }
//    }
//    return ""
//}


//Given an array of Ints, find the two numbers that when multiplied together give the greatest product, and return that product.

let inputArr = [1, 2, 7, 3, 9, 5] //output = 63; 7 x 9 = 63

func findLargestProduct(arr: [Int]) -> Int {
    switch arr.count {
    case 0:
        return 0
    case 1:
        return arr.first!
    case 2:
        return arr.reduce(1, *)
    default:
        return arr.max()! * findSecondLargest(arr: arr)
    }
}
//edge case [7,4]
print(findLargestProduct(arr: inputArr))
print(findLargestProduct(arr: [7,4]))


//Find the sum of all elements in a two dimensional, rectangular array except for the corners.

let inputMatrix = [[1,3,9,2],[3,2,0,3],[2,8,1,4]]

func findSumExceptForCorners(matrix: [[Int]]) -> Int {
    let matrixHeight = matrix.count
    let matrixLength = matrix.first!.count
    var sum = 0
    for (index1, row) in matrix.enumerated() {
        for (index2, element) in row.enumerated() {
            let coordinates = (row: index1, column: index2)
            switch coordinates {
            case (row: 0, column: 0):
                break
            case (row: 0, column: matrixLength - 1):
                break
            case (row: matrixHeight - 1, column: 0):
                break
            case (row: matrixHeight - 1, column: matrixLength - 1):
                break
            default:
                sum += element
            }
        }
    }
    return sum
}

print(findSumExceptForCorners(matrix: inputMatrix))



//Given two sorted arrays, write a function that returns a single sorted list with all the elements from the inputs. Your solution must work in O(n) time.

let inputArray1 = [3, 4, 6, 10, 11, 15]
let inputArray2 = [1, 5, 8, 12, 14, 19, 31]

public func sortArrs(arr1: [Int], arr2: [Int]) -> [Int] {
    return (arr1 + arr2).sorted()
}
print(sortArrs(arr1: inputArray1, arr2: inputArray2))


//Write a function that takes an integer and an unsorted array of numbers and returns true if there's any pair of numbers in that array that can be summed up to the input integer.

func checkNums(arr: [Int], n: Int) -> Bool {
    var bool = Bool()
    var numStorage = [Int:Int]()
    for num in arr {
        if numStorage[num] == nil {
            numStorage[num] = 1
        } else {
            numStorage[num] = numStorage[num]! + 1
        }
    }
    
    for num in arr {
        let numImLookingFor = numStorage[n-num]
        if numImLookingFor != nil && numImLookingFor != num {
            bool = true
            break
        }
    }
    return bool
}
print(checkNums(arr: [3,3], n: 6))
print(checkNums(arr: [3,4,2,1], n: 5))
print(checkNums(arr: [1,2,5,4,2], n: 7))
print(checkNums(arr: [1,2,5,4,2], n: 2))


