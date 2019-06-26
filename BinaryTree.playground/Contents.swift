import UIKit

/*
 Binary Tree - A tree whose elements have at most 2 children is called a binary tree. Since each element in a binary tree can have only 2 children, we typically name them the left and right child.
 The reason we use a class for tree is because we have a variable that points to self. We can't do that in a struct
 */

class BinaryTreeNode<T:Equatable> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    init(value: T) {
        self.value = value
    }
    public func inOrderTraversal(visit: (BinaryTreeNode) -> Void) {
        leftChild?.inOrderTraversal(visit: visit)
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
    }
    public func preOrderTraversal(visit: (BinaryTreeNode) -> Void) {
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    public func postOrderTraversal(visit: (BinaryTreeNode) -> Void) {
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
    public func search(value: T) -> BinaryTreeNode? {
        var returnNode: BinaryTreeNode?
        inOrderTraversal { (node) in
            if node.value == value {
                returnNode = node
            }
        }
        if let returnNode = returnNode {
            return returnNode
        } else {
            return nil
        }
    }
}

let tenNode = BinaryTreeNode<Int>(value: 10)
let twoNode = BinaryTreeNode<Int>(value: 2)
let fiveNode = BinaryTreeNode<Int>(value: 5)

tenNode.leftChild = twoNode
tenNode.rightChild = fiveNode

let fourNode = BinaryTreeNode<Int>(value: 4)
let nineNode = BinaryTreeNode<Int>(value: 9)

twoNode.leftChild = fourNode
twoNode.rightChild = nineNode

let sevenNode = BinaryTreeNode<Int>(value: 7)
let elevenNode = BinaryTreeNode<Int>(value: 11)

fiveNode.leftChild = sevenNode
fiveNode.rightChild = elevenNode

print("in-order traversal")
tenNode.inOrderTraversal { (node) in
    print(node.value, terminator: " ")
}
print("\n pre-order traversal")
tenNode.preOrderTraversal { (node) in
    print(node.value, terminator: " ")
}
print("\n post-order traversal")
tenNode.postOrderTraversal { (node) in
    print(node.value, terminator: " ")
}



public class Tree {
    public var x : Int = 0
    public var l : Tree?
    public var r: Tree?
    public init () {}
}

extension Tree {
    public func preOrderTraversal(visit: (Tree) -> Void) {
        visit(self)
        l?.preOrderTraversal(visit: visit)
        r?.preOrderTraversal(visit: visit)
    }
}

public func solution(_ T: Tree?) -> Int {
    var counter = 0
    var dict = [Int:Bool]()
    T?.preOrderTraversal(visit: { (node) in
        if let _ = dict[node.x] {
            return
        } else {
            counter += 1
        }
    })
    return counter
}
print("/n")


//print(solution(<#T##T: Tree?##Tree?#>))


let ranks = [3,4,3,0,2,2,3,0,0]
var storageDictionary = [Int:Int]()


for rank in ranks {
    if let rankExists = storageDictionary[rank] {
        storageDictionary[rank] = rankExists + 1
    } else {
        storageDictionary[rank] = 1
    }
}

var counter = 0
for (rankLevel, frequency) in storageDictionary {
    if let _ = storageDictionary[rankLevel + 1] {
        counter += frequency
    }
}
print(counter)
