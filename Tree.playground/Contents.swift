import UIKit

/*
 Tree
 
 root (parent)
 child
 leaf (child with no children)
 data (the value, the node)
 level-order
 depth-order
 */

//it's a class because if we are pointing to a treeNode, pointing to itself. It's recursively, cannot be struct.

struct Queue<T> {
    private var elements = [T]()
    
    public var count: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    public mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    public mutating func dequeue() -> T? {
        guard !elements.isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    public func peek() -> T? {
        return elements.first
    }
}



class TreeNode<T:Equatable> {
    var value: T
    var parent: TreeNode?
    var children = [TreeNode]()
    init(_ value: T) {
        self.value = value
    }
    public func addChild(_ child: TreeNode) {
        children.append(child)
        child.parent = self
    }
    
    //traversing: walking or navigating through all the nodes of the tree
    
    //level-order traversal - going through each element by level
    
    //depth-order traversal - going to the end of each child first, then going back to the next child
    
    public func levelOrder(visit: (TreeNode) -> Void) {
        //visit current treeNode
        // capture the current tree node's value
        visit(self)
        
        //create a queue to
        var queue = Queue<TreeNode>()
        
        //visit each node's child and append to queue (enqueue)
        children.forEach { queue.enqueue($0) }
        
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach{ queue.enqueue($0) }
        }
    }
    
    //depth-order traversal - uses recursion to visit the child node, then its chidren, and so on
    public func depthOrderTraversal(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach{ $0.depthOrderTraversal(visit: visit) }
    }
    
    public func search(_ value: T) -> Bool {
        var isFound = false
        levelOrder { (node) in
            if node.value == value {
                isFound = true
            }
        }
        return isFound
    }
}

let beverages = TreeNode<String>("beverages")
let hot = TreeNode<String>("hot")
let cold = TreeNode<String>("cold")

beverages.addChild(hot)
beverages.addChild(cold)

let tea = TreeNode<String>("tea")
let coffee = TreeNode<String>("coffee")
let chocolate = TreeNode<String>("chocolate")

hot.addChild(tea)
hot.addChild(coffee)
hot.addChild(chocolate)

let black = TreeNode<String>("black")
let green = TreeNode<String>("green")
let chai = TreeNode<String>("chai")

tea.addChild(black)
tea.addChild(green)
tea.addChild(chai)

let soda = TreeNode<String>("soda")
let milk = TreeNode<String>("milk")

cold.addChild(soda)
cold.addChild(milk)

let gingerale = TreeNode<String>("gingerale")
let coke = TreeNode<String>("coke")

soda.addChild(gingerale)
soda.addChild(coke)

beverages.levelOrder { (node) in
    print(node.value, terminator: ", ")
}

beverages.depthOrderTraversal { (node) in
    print(node.value, terminator: ", ")
}

//test searching
print("\nsearching...")
if beverages.search("coke") {
    print("enjoy yoy")
}
