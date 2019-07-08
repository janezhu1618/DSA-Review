import UIKit

/*
 HEAP
 - A binary tree inside an array
 - Heap property - keep that heap valid, that parent adheres to the heap property
 - Max-heap: parent is larger than children
 - Min-heap: parent is smaller than children
 - Shift up (sifting)
 - Shift down (sifting)
 - Heapitfy - pass in an array of unsorted values and change into heap

 - parent index (i-1)/2
 - left child index 2 * i + 1
 - right child index: 2 * 1 + 2
 
 Common Operations
 - insert()
 - remove()
 - remove(index: )
 - replace(index: , value: )
 - all above take O(log n) time
 
 Some Applications
 - Priority Queue
 - Order Statistics - efficiently find the kth smallest or largest element in an array
 - Graph Algorithms - Dijkstra's shortest path algorithm
 */

let heap1 = [18, 12, 11, 10, 7]

/*
    18
   /  \
  12  11
 / \
10  7
 This is a complete tree - all levels have 2 children and the last level, it's built from left to right
*/

//Appending the new value to the array e.g. 20

struct Heap<T> {
    //elements in the heap
    private var elements = [T]()
    
    //how do we know we are building a min or max heap?
    /*
     max-heap: parent node is larger than any child node
     min-heap: parent node is smaller than any child node
     
     max heap                           min heap
     ========                           ========
        18                                  2
       /  \                               /   \
     12  11                              8    11
    / \                                 / \    /
   10  7                               12  20 14
 */
    //how do we know what type of heap we are building: is it a min or max heap?
    //we use a sorting closure to determine heap type
    //e.g. max-head >
    //e.g. min-heap <
    private var sortingCriteria: (T,T) -> Bool
        
    init(sortingCriteria: @escaping (T,T) -> Bool) {
        self.sortingCriteria = sortingCriteria
    }
    
    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
    
    public mutating func insert(_ value: T) {
        
        //rule 1: append vaue to array
        elements.append(value)
        
        //rule 2: fix heap property by calling shiftUp(index)
        shiftUp(elements.count - 1)
    }
    
    private mutating func shiftUp(_ index: Int) {
        let child = elements[index]
        var childIndex = index
        var parentIndex = self.parentIndex(childIndex)
        while childIndex > 0 && sortingCriteria(child, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex] //overwrite child value with parent's value
            childIndex = parentIndex
            parentIndex = self.parentIndex(childIndex)
        }
        elements[childIndex] = child
    }
    
}

var list = Heap<Int>(sortingCriteria: >)

list.insert(18)
list.insert(12)
list.insert(11)
list.insert(10)
list.insert(7)

print(list)

list.insert(83)


