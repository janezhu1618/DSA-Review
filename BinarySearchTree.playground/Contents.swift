import UIKit

/*
 Binary Search Tree
 
 */
//it's a class because classes are reference types and can refer to itself
class BinaryNode<T: Equatable>: Equatable {
    var value: T
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    static func == (lhs: BinaryNode<T>, rhs: BinaryNode<T>) -> Bool {
        return lhs.value == rhs.value &&
                lhs.leftChild == rhs.leftChild &&
                lhs.rightChild == rhs.rightChild
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    public func inOrderTraversal(visit: (BinaryNode) -> Void) {
        leftChild?.inOrderTraversal(visit: visit)
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
    }
}

//func getHeight(node: BinaryNode<Int>?) -> Int {
//    return
//}

public struct BinarySearchTree<T: Comparable> {
    private var root: BinaryNode<T>?
    
    public func printInOrder() {
        root?.inOrderTraversal(visit: { (node) in
            print(node.value)
        })
    }
    
    public mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
        guard let node = node else { return BinaryNode(value) }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
    
}

var myTree = BinarySearchTree<Int>()
myTree.insert(10)
myTree.insert(5)
myTree.insert(7)
myTree.insert(40)
myTree.printInOrder()
