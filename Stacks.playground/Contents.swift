import UIKit

//Stacks

struct Stack<T> {
    private var arr = [T]()
    
    public var count: Int {
        return arr.count
    }
    
    public var isEmpty: Bool {
        return arr.isEmpty
    }
    
    public mutating func push(element: T) {
        arr.append(element)
    }
    
    public mutating func pop() -> T? {
        guard !arr.isEmpty else { return nil }
        return arr.removeLast() //or arr.popLast()
    }
    
    public mutating func peek() -> T? {
        return arr.last
    }
}


var names = Stack<String>()
names.push(element: "Matt")
names.push(element: "Diego")
names.push(element: "Li")
print(names)
print(names.peek() ?? "empty")
names.pop()
print(names)
