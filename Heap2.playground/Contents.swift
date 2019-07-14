import UIKit

/*
 More practice on heap
 - left-child: 2i + 1
 - right-child: 2i + 2
 - parent (i-1)/2
 - heap fills up its nodes from left to right on each level
 */

struct Heap<T: Equatable> {
    private var elements = [T]()
    
    private var sortingCriteria: (T,T) -> Bool
    
    public var count: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var peek: T? {
        return elements.first
    }
    //by definition, we are interested in the root because it will be the biggest or smallest
    
    init(sortingCriteria: @escaping (T,T) -> Bool) {
        self.sortingCriteria = sortingCriteria
    }
    //does not take in an array, only takes in the heap property
    
    init(_ arr: [T], sortingCriteria: @escaping (T,T) -> Bool) {
        self.sortingCriteria = sortingCriteria
        heapify(arr)
    }
    //initialize a heap with values already inside
    
    private func parentIndex(_ index: Int) -> Int {
        return (index - 1)/2
    }
    
    private func leftChildIndex(_ index: Int) -> Int {
        return (2 * index) + 1
    }
    
    private func rightChildIndex(_ index: Int) -> Int {
        return (2 + index) + 2
    }
    
    public mutating func insert(_ value: T) {
        elements.append(value)
        shiftUp(elements.count-1)
    }
    
    private mutating func shiftUp(_ index: Int) {
        let child = elements[index]
        var childIndex = index
        var parentIndex = self.parentIndex(childIndex)
        while childIndex > 0 && sortingCriteria(child, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(childIndex)
        }
        elements[childIndex] = child
    }
    
    public mutating func remove() -> T? {
        guard isEmpty else { return nil }
        
        if elements.count == 1 {
            return elements.removeFirst()
        }
        
        let value = elements[0]
        elements[0] = elements.removeLast()
        shiftDown(0)
        return value
    }
    
    private mutating func heapify(_ arr: [T]) {
        elements = arr
        for index in stride(from: (elements.count)/2, through: 0, by: -1) {
            shiftDown(index)
        }
    }
    

    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(fromIndex: index, to: elements.count)
    }
    
    private mutating func shiftDown(fromIndex index: Int, to endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index // this is used to keep track as we walk down the tree
        if leftChildIndex < endIndex && sortingCriteria(elements[leftChildIndex], elements[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        elements.swapAt(first, index)
        shiftDown(fromIndex: first, to: endIndex)
    }
    
    public mutating func remove(atIndex index: Int) -> T? {
        guard !elements.isEmpty, index >= 0 else { return nil }
        
        let size = elements.count - 1 // size here is the valid indices in the Heap
        
        if index <= size {
            // we sway the last element with the element at the given index
            // this allows up to remove the last element without affected the Heap structure
            elements.swapAt(index, size)
            
            // we first shift down the Heap to fix any unsorted sorted elements
            shiftDown(fromIndex: index, to: size)
            
            // then we shift up to fix from the index to the root of the Heap
            shiftUp(index)
        }
        
        // finally we remove and return the last element
        return elements.removeLast()
    }
    
    public mutating func replace(index: Int, withValue value: T) {
        guard !elements.isEmpty, index >= 0 else { return }
        remove(atIndex: index)
        insert(value)
    }
}



struct PriorityQueue<T: Equatable> {
    private var heap: Heap<T>
    public init(sort: @escaping (T,T) -> Bool) {
        heap = Heap(sortingCriteria: sort)
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public func peek() -> T? {
        return heap.peek
    }
    
    public mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    public mutating func dequeue() -> T? {
        return heap.remove()
    }
    
    public mutating func changePriority(index i: Int, value: T) {
        return heap.replace(index: i, withValue: value)
    }
}
