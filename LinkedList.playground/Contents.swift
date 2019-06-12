import UIKit

//LinkedList a collection of nodes

class Node<T> {
    var value: T
    var next: Node?
    weak var previous: Node? //avoid retain cycle of memory  if you nil something out, you don't want there to still be a reference
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T>: CustomStringConvertible {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        let nodeToAdd = Node(value: value)
        if let lastNode = tail {
            lastNode.next = nodeToAdd
        } else {
            head = nodeToAdd
        }
        tail = nodeToAdd
    }
    
    public var count: Int {
        guard let head = head else { return 0 }
        var counter = 1
        var currentNode = head
        while let next = currentNode.next {
            counter += 1
            currentNode = next
        }
        return counter
    }
    
    var description: String {
        guard let currentHead = head else { return " " }
        var currentNode = currentHead
        var output = "\(currentNode.value) -> "
        while let next = currentNode.next {
            output += "\(next.value) -> "
            currentNode = next
        }
        return output + "nil"
    }
    
    public func insertToBeginning(value: T) {
        let newNode = Node(value: value)
        if let oldHead = head {
            head = newNode
            head?.next = oldHead
        } else {
           head = newNode
        }
    }
    
    public func insertToMiddle(value: T) {
        guard let head = head else {
            append(value: value)
            return }
        var currentNode = head
        var previousNode = head
        let indexToInsert = count/2
        let newNode = Node(value: value)
        var counter = 0
        while counter < indexToInsert {
            if let next = currentNode.next {
                previousNode = currentNode
                currentNode = next
            }
            counter += 1
        }
        previousNode.next = newNode
        newNode.next = currentNode
    }
    
    public func shift1Over() {
        guard let head = head, let _ = head.next else { return }
        let indexOf2ndToLast = count - 1
        var currentNode = head
        var counter = 1
        while counter < indexOf2ndToLast {
            if let next = currentNode.next {
                currentNode = next
            }
            counter += 1
        }
        let lastNode = last!
        let secondToLast = currentNode
        tail = secondToLast
        secondToLast.next = nil
        insertToBeginning(value: lastNode.value)
    }
}

let myFirstNode = Node(value: 5)
myFirstNode.next = Node(value: 7)
myFirstNode.next?.next = Node(value: 8)

let myFirstLinkedList = LinkedList<Int>()
myFirstLinkedList.append(value: 6)
myFirstLinkedList.append(value: 8)
myFirstLinkedList.append(value: 10)
print(myFirstLinkedList.description)
myFirstLinkedList.insertToBeginning(value: 11)
print(myFirstLinkedList.description)

//create a method inside the linked list class to add a node at the start and then another for the middle

//create a function that takes a linked list and shuffles everything by one. the tail wraps around and becomes the head


print(myFirstLinkedList.count) //4
myFirstLinkedList.insertToMiddle(value: 5)
print(myFirstLinkedList.description)
myFirstLinkedList.insertToMiddle(value: 0)
print(myFirstLinkedList.description)
myFirstLinkedList.shift1Over()
print(myFirstLinkedList.description)
