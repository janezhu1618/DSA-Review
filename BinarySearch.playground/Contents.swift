import UIKit

func binarySearch(array: [Int], item: Int) -> Int? {
    var low = 0
    var high = array.count-1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = array[mid]
        if guess == item {
            return mid
        } else if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return nil
}
let list = [1,3,5,7,9]
print(binarySearch(array: list, item: 3)) //returns 1
print(binarySearch(array: list, item: -1)) //returns nil
//128,64,32,16,8,2,1
