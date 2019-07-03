import UIKit

/*
Quicksort
 - runtime: O(n log n)
 - space complexity: O(1) constant because we are swapping in place
 - divide and conquer
 - sort in place algorithm
 - pivot is used to partition the array
 - base case is reached when low index in the array is not less than high index in the array
 - recursively call algorithm until base case
 
 - lomuto's partitioning -> selecting the last element, walk tehe array with element j
 - other partitioning algorithms: hoare's, Dutch flag
 
 - Lomuto's Partitioning
 ====================
 - use the last element as the pivot
 - walk the array with element j
 - swap element j with i if element j is less than pivot element
 - if a swap is performed then we increment i by 1
 - at the end of walking the array
 - we swap element at i with element at pivot
 */


func lomutoPartitioning<T: Comparable>(_ arr: inout [T],
                                       low: Int,
                                       high: Int) -> Int {
    let pivot = arr[high]
    var i = low
    for j in low..<high {
        if arr[j] < pivot {
            
            //arr.swapAt(i, j)
            let tmp = arr[j]
            arr[j] = arr[i]
            arr[i] = tmp
            
            //increment i
            i += 1
        }
    }
    arr.swapAt(i, high)
    return i
}

var list = [19,2,6,0,-11,96,34]
let pivot = lomutoPartitioning(&list, low: 0, high: list.count-1)


