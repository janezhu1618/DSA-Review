import UIKit

/* Binary Search Tree 2
 */

class BinaryNode<T: Equatable>: Equatable {
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    init(_ value: T) {
        self.value = value
    }
    public static func == (lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
        return lhs.value == rhs.value &&
                lhs.leftChild == rhs.leftChild &&
                lhs.rightChild == rhs.rightChild
    }
    
    public func inOrderTraversal(visit: (BinaryNode) -> Void) {
        leftChild?.inOrderTraversal(visit: visit)
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
    }
    
    public func preOrderTraversal(visit: (BinaryNode) -> Void) {
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    
    public func postOrderTraversal(visit: (BinaryNode) -> Void) {
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
    
}

//struct is a value type, you need to say mutating to change the root
public struct BinarySearchTree<T: Comparable> {
    private var root: BinaryNode<T>?
    
    public func printInOrderTraversall() {
        root?.inOrderTraversal(visit: { (node) in
            print(node.value, terminator: " ")
        })
    }
    
    public mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
    }
    
//    public mutating func remove(_ value: T) {
//        root = remove(from: root, value: value)
//    }
//
//    private func remove(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
//        guard let node = node else { return BinaryNode(value) }
//    }
    
    private func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
        //the tree is empty!
        guard let node = node else { return BinaryNode(value) }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
    
    public func search(_ value: T) -> Bool {
        var current = root
        
        while let node = current {
            if value == node.value {
                return true
            } else if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
}

var myTree = BinarySearchTree<Int>()
myTree.insert(26)
myTree.insert(14)
myTree.insert(42)
myTree.printInOrderTraversall()

func search(node: BinaryNode<Int>?, searchValue: Int) -> Bool {
    guard let node = node else { return false }
    if node.value == searchValue {
        return true
    } else if node.value > searchValue {
        return search(node: node.leftChild, searchValue: searchValue)
    } else {
        return search(node: node.rightChild, searchValue: searchValue)
    }
}

let node1 = BinaryNode(1)
let node3 = BinaryNode(3)
node1.rightChild = node3
print(search(node: node1, searchValue: 3))
