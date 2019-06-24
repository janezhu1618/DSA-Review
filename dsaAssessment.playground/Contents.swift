import UIKit

//Question 2
public func anagram(str1: String, str2: String) -> Bool {
    return str1.sorted() == str2.sorted()
}

print(anagram(str1: "iceman", str2: "cinema"))
//runtime O(n) because we are sorting the strings


//Question 3
//Given an array of Ints, find the two numbers that when multiplied together give the greatest product, and return that product.
let input =  [1, 2, 7, 3, 9, 5]

public func findLargestProduct(arr: [Int]) -> Int {
    guard arr.count > 2 else { return 0 }
    let sortedArr = arr.sorted()
    return sortedArr[arr.count-1] * sortedArr[arr.count-2]
}
print(findLargestProduct(arr: input))
//runtime O(n) because we are sorting the arr


//Question 4
//Given two sorted arrays, write a function that returns a single sorted list with all the elements from the inputs. Your solution must work in O(n) time.

public func solution(arr1: [Int], arr2: [Int]) -> [Int] {
    let combinedArr = arr1 + arr2
    print(combinedArr)
    return sortArr(combinedArr)
}

public func sortArr(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    let pivot = arr[arr.count/2]
    print(pivot)
    var lessThan = [Int]()
    var greaterThan = [Int]()
    var equalTo = [Int]()
    for num in arr {
        if num < pivot {
            lessThan.append(num)
        } else if num > pivot {
            greaterThan.append(num)
        } else {
            equalTo.append(num)
        }
    }
    print("I got up to here")
    return sortArr(lessThan) + equalTo + sortArr(greaterThan)
}

let input1 = [3, 4, 6, 10, 11, 15]
let input2 = [1, 5, 8, 12, 14, 19, 31]
print(solution(arr1: input1, arr2: input2))
//runtime O(n)



func checkForBalance(str: String) -> String {
    guard str.count % 2 == 0 else { return "NO" }
    var returnBool = true
    for (index, char) in str.enumerated() {
        let endingIndex = str.index(str.endIndex, offsetBy: (index+1) * -1)
        if char == "{" && str[endingIndex] != "}" {
            returnBool = false
            break
        } else if char == "[" && str[endingIndex] != "]" {
            returnBool = false
            break
        } else if char == "(" && str[endingIndex] != ")" {
            returnBool = false
            break
        }
    }
    return returnBool ? "YES" : "NO"
}

let strInput1 = "{[()]}"
let strInput2 = "{[(])}"
let strInput3 = "{{[[(())]]}}"
print(checkForBalance(str: strInput1))
print(checkForBalance(str: strInput2))
print(checkForBalance(str: strInput3))
//runtime O(n)



//Using the doubly linked below. Print the elements of the linked list in reverse.
class LLNode<T> {
    var next: LLNode?
    var previous: LLNode?
    var value: T
    init(_ value: T) {
        self.value = value
        self.next = nil
    }
}

extension LLNode: CustomStringConvertible {
    var description: String {
        guard let _ = next else { return "[\(value)]" }
        var currentNode = next
        var result = "\(value) -> "
        while let node = currentNode {
            result += node.next != nil ? "\(node.value) -> " : "\(node.value) -> nil"
            currentNode = currentNode?.next
        }
        return result
    }
}

let threeNode = LLNode(3)
let eightNode = LLNode(8)
let fourNode = LLNode(4)
let oneNode = LLNode(1)

threeNode.next = eightNode
eightNode.next = fourNode
fourNode.next = oneNode

oneNode.previous = fourNode
fourNode.previous = eightNode
eightNode.previous = threeNode

print(threeNode)

func printLLReverse(node: LLNode<Int>) {
    var currentNode = node
    var output = "\(currentNode.value) -> "
    
    while let prev = currentNode.previous {
        output += "\(prev.value) -> "
        currentNode = prev
    }
    output += "nil"
    print(output)
}

printLLReverse(node: oneNode)
//runtime O(n)



func setToPower(x: Int, y: Int) -> Int {
    guard y > 1 else { return x }
    return x * setToPower(x: x, y: y-1)
}
print(setToPower(x: 3, y: 4))



let sampleArr = [1, 2, 3, 2, 1, 2, 2, 2, 3, 3]
let k = 2
public func findKthMostFrequent(arr: [Int], k: Int) -> Int {
    var frequencyDict = [Int:Int]()
    for num in arr {
        if let frequency = frequencyDict[num] {
            frequencyDict[num] = frequency + 1
        } else {
            frequencyDict[num] = 1
        }
    }
    var numberByFrequencyOrder = frequencyDict.values.sorted{ $0 > $1 }
    print(numberByFrequencyOrder)
    let kthFrequency = numberByFrequencyOrder[k-1]
    print(kthFrequency)
    var returnNum = 0
    for (key, value) in frequencyDict {
        if key == kthFrequency {
            returnNum = value
        }
    }
    return returnNum
}
print(findKthMostFrequent(arr: sampleArr, k: k))

//runtime O(n)

struct Queue<T> {
    private var arr = [T]()

    public var count: Int {
        return arr.count
    }
    public var isEmpty: Bool {
        return arr.isEmpty
    }
    public mutating func enqueue(_ value: T) {
        arr.append(value)
    }
    public mutating func dequeue() -> T? {
        guard !arr.isEmpty else { return nil }
        return arr.removeLast()
    }
    public func peek() -> T? {
        return arr.first
    }
}

var numbers = Queue<Int>()
numbers.enqueue(8)
numbers.enqueue(1)
numbers.enqueue(-23)
numbers.enqueue(11)
print(numbers)

private func findSmallestInt(q: Queue<Int>) -> Int {
    var copyOfQ = q
    guard let firstValue = copyOfQ.dequeue() else { return 0 }
    var smallestInt = firstValue
    while let value = copyOfQ.dequeue() {
        if value < smallestInt {
            smallestInt = value
        }
    }
    return smallestInt
}
print(findSmallestInt(q: numbers))



for index in stride(from: 9.0, through: 10.0, by: 0.1) {
    print(index)
}

func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool {
    return number % divisor == 0
}
print(isNumberDivisible(6, by: 4))

func isPrime(_ number: Int) -> Bool {
    guard number > 0 else { return false }
    var divisors = [Int]()
    for divisor in 1...number where isNumberDivisible(number, by: divisor) {
        divisors.append(divisor)
        if divisors.count > 2 {
            break
        }
    }
    if divisors.count == 2 {
        return true
    } else {
        return false
    }
}
print(isPrime(12))
print(isPrime(2))
print(isPrime(1))
print(isPrime(16))

func fibonacci(_ number: Int) -> Int {
    guard number > 2 else { return 1 }
    return fibonacci(number - 1) + fibonacci(number - 2)
}
print(fibonacci(10))
