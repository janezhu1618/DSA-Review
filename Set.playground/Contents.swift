import UIKit

//Set: a unique collection, unsorted, elements need to be hashable

let cohorts: Set<String> = ["iOS", "android", "web", "iOS"]

print(cohorts)

let fellows = ["Ashli", "Ian", "Stephanie", "Joshua", "Kathy", "Ian"]

var uniqueFellows = Set(fellows)

print(uniqueFellows)

uniqueFellows.insert("Matt") //order doesn't matter .remove("name")
print(uniqueFellows)

/* wont compile because Person is a custom object and people are not hashable
struct Person {
    let name: String
    let age: String
}
let alex = Person(name: "Tom", age: "29")
let sally = Person(name: "Sally", age: "26")

let names: Set<Person> = [alex, sally]
*/

struct Person: Hashable {
    let name: String
    let age: String
}
let alex = Person(name: "Tom", age: "29")
let sally = Person(name: "Sally", age: "26")

let names: Set<Person> = [alex, sally]

/*Set Operations
 a.intersection(b)
 a.symmetricDifference(b)
 a.union(b)
 a.subtracting(b)
 //https://camo.githubusercontent.com/31d45222f9a3e07ad240dbd3bb0ed10eda4984eb/68747470733a2f2f646f63732e73776966742e6f72672f73776966742d626f6f6b2f5f696d616765732f73657456656e6e4469616772616d5f32782e706e67
 */



let list1: Set = [1, 3, 4, 6, 2, 7, 9]
let list2: Set = [3, 7, 13, 10, 4]

//Find the intersection and print the result

print(list1.intersection(list2))

//Find the symmetric difference and print the result
print(list1.symmetricDifference(list2))

//Find the union and print the result
print(list1.union(list2))

//What is the outcome of subtracting list 2 from list1? Print the result
print(list1.subtracting(list2))

