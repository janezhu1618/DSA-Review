import UIKit

/*
 MergeSort runtime O(n log n), space-complexity O(n)
 - divide and conquer O(n log n)
 - mid index arr.count/2
 - arr.count == 1 (base case)
 - merge left and right array
 */

public func mergeSort<T: Comparable>(_ arr: [T]) -> [T] {
    //base case where arr count is 1
    guard arr.count > 1 else { return arr }
    
    let midIndex = arr.count/2
    let leftArray = mergeSort(Array(arr[0..<midIndex]))
    let rightArray = mergeSort(Array(arr[midIndex..<arr.count]))
    //TODO: merge left and right and return
    
    return mergeArrays(leftArray, rightArray)
}


func mergeArrays<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var result = [T]()
    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
}


var array = [2,4,5,8]
func square(arr: [Int]) -> [Int] {
    return arr.map{ $0 * $0 }
}
print(square(arr: array))


func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
    guard num_people > 1 else { return [candies] }
    var distribution = Array(repeating: 0, count: num_people)
    var candiesCounter = candies
    var numberOfCandiesLastGivenOut = 0
    var personIndex = 0
    
    while candiesCounter > 0 {
        if numberOfCandiesLastGivenOut < candiesCounter {
            numberOfCandiesLastGivenOut += 1
        } else {
            numberOfCandiesLastGivenOut = candiesCounter
        }
        distribution[personIndex % num_people] += numberOfCandiesLastGivenOut
        personIndex += 1
        candiesCounter -= numberOfCandiesLastGivenOut
    }
    return distribution
}

print(distributeCandies(7, 4))
print(distributeCandies(10, 3))
