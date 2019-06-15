import UIKit

//Queues - First in first out FIFO - print queue, waiting in line
class Queue<T> {
    //private var because we don't want anyone else ot access this array...then it wouldn't be a queue anymore
    private var arr = [T]()
    
    public func enqueue(element: T) {
        arr.append(element)
    }
    
    public func dequeue() -> T? {
        return arr.isEmpty ? nil : arr.removeFirst()
    }
    
    public func peek() -> T? {
        return arr.first
    }
    
    public func isEmpty() -> Bool {
        return arr.isEmpty
    }
}

let myFirstIntQueue = Queue<Int>()
let myFirstStringQUeue = Queue<String>()
myFirstIntQueue.enqueue(element: 6)
myFirstIntQueue.enqueue(element: 9)
myFirstIntQueue.enqueue(element: 11)
print(myFirstIntQueue)
myFirstIntQueue.dequeue()
myFirstIntQueue.dequeue()
myFirstIntQueue.enqueue(element: 13)
myFirstIntQueue.peek()
myFirstIntQueue.isEmpty()

//implementing queue using linkedlist
class Node<T> {
    var value: T
    var next: Node<T>?
    weak var prev: Node<T>? //so it doesn't hold a reference
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    public var first: Node<T>? {
        return head
    }
    public var last: Node<T>? {
        return tail
    }
    public var isEmpty: Bool {
        return head == nil ? true : false
    }
    public func append(element: T) {
        let newNode = Node(value: element)
        if let tail = tail {
            tail.next = newNode
            newNode.prev = tail
        } else {
            head = newNode
        }
        tail = newNode
    }
    public func removeLast() -> T? {
        if let objectToRemove = tail {
            tail = objectToRemove.next
            tail?.next = nil
            return objectToRemove.value
        } else {
            return nil
        }
    }
    public func removeFirst() -> T? {
        if let objectToRemove = head {
            head = objectToRemove.next
            head?.prev = nil
            return objectToRemove.value
        } else {
            return nil
        }
    }
}

struct QueueLL<T> {
    private var elements: LinkedList<T>
    
    public func enqueue(element: T) {
        elements.append(element: element)
    }
    
    public func dequeue() -> T? {
        return elements.removeFirst()
    }
    
    public func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    public func peek() -> T? {
        return elements.first?.value
    }
}


//Given a linkedlist of strings, determine if any of the values are palindrome of each other


//Given a linkedlist of ints, write a function that square every value in the list
