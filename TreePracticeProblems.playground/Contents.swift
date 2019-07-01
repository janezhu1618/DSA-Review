import UIKit

//implement a binary tree
class BinaryTreeNode<T> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(_ value: T) {
        self.value = value
    }
    
    
}

/*
         4
       /   \
     2      6
   /  \    / \
  1   3   5   7
           \
           10
 */

let tree4 = BinaryTreeNode<Int>(4)
let tree2 = BinaryTreeNode<Int>(2)
let tree6 = BinaryTreeNode<Int>(6)

tree4.leftChild = tree2
tree4.rightChild = tree6

let tree1 = BinaryTreeNode<Int>(1)
let tree3 = BinaryTreeNode<Int>(3)

tree2.leftChild = tree1
tree2.rightChild = tree3

let tree5 = BinaryTreeNode<Int>(5)
let tree7 = BinaryTreeNode<Int>(7)

tree6.leftChild = tree5
tree6.rightChild = tree7

let tree10 = BinaryTreeNode<Int>(10)

tree5.rightChild = tree10

func getHeight<T>(_ node: BinaryTreeNode<T>?) -> Int {
    guard let node = node else { return -1 }
    return 1 + max(getHeight(node.leftChild), getHeight(node.rightChild))
}

//Problem 1. Get Height of Binary Tree
getHeight(tree4)

//balance tree = the difference between max and min is 1

var allPaths = [[Int]]()

func getPaths<T>(_ node: BinaryTreeNode<T>?, path: [Int] = []) {
    guard let node = node else { return }
    var path = path //shadow variable to make path mutable
    if node.leftChild == nil && node.rightChild == nil {
        path.append(node.value as! Int)
        allPaths.append(path)
    } else {
        path.append(node.value as! Int)
        if node.leftChild != nil {
            getPaths(node.leftChild, path: path)
        }
        if node.rightChild != nil {
            getPaths(node.rightChild, path: path)
        }
    }
}

getPaths(tree6)
print(allPaths)

extension BinaryTreeNode {
    public func inOrderTraversal(visit: (BinaryTreeNode) -> Void) {
        leftChild?.inOrderTraversal(visit: visit)
        visit(self)
        rightChild?.inOrderTraversal(visit: visit)
    }
}

//Problem 6. Return the count of paths in a Binary Tree
func countPaths<T>(_ tree: BinaryTreeNode<T>) -> Int {
    var count = 0
    tree.inOrderTraversal { (node) in
        if node.leftChild == nil && node.rightChild == nil {
            count += 1
        }
    }
    return count
}
countPaths(tree4)
