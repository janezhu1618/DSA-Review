import UIKit

struct PhoneNumber {
    let countryCode: String?
    let areaCode: String
    let numbers: String
    var completeNumber: String {
        return "\(countryCode ?? "")\(areaCode)\(numbers)"
    }
    init(countryCode: String?, areaCode: String, numbers: String) {
        self.countryCode = countryCode
        self.areaCode = areaCode
        self.numbers = numbers
    }
//    static func isValid(_ str: String) -> PhoneNumber? {
//        if str.count == 10 {
//
//        } else if str.count == 11 {
//
//        } else {
//            return nil
//        }
//    }
}

let myNumber = PhoneNumber(countryCode: nil, areaCode: "918", numbers: "8999090")
print(myNumber.completeNumber)


/*
 Classes
 - reference types
    - mutable: instance method does not to be marked as mutating. instances that are constants (marked with let) can be changed
    - multiple references: points to the same spot in memory when two instances are set equal to each other
 - inheritance: a child class can inherit from the parent class and all its properities and methods e.g. class Animal, then class Dog: Animal.
    - child class can override functions of parent class
    - subclass can inherit the initializer from super or parent by calling super.init()
 */


class Animal {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let pig = Animal(name: "Peppa")
pig.name = "Piglet"
print(pig.name)
var bear = Animal(name: "Pooh")
bear = pig //now both instances point to the same reference
print(bear.name)
bear.name = "Rilakuma"
print(pig.name) //never changed pig's name, but because animal is a class and class is a reference type, the two variables are now linked. Whatever change made to one instance will carry over to the other instance.





/*
 Structs
 - value types, we make copies of instances when we set them equal to each other, each copy keeps its own properties
 - immutable - that's why we need to add mutating to a method if we want to change the property e.g. public mutating func
 - do not need to have an explicit initializer because it has no stored properties or all stored properties have default values. They automatically get an initializer with no parameters init(). If you add any explicit initializer, you lose the default one.
 - Memberwise initializer: a struct that has stored properties and that doesn't have an explicit initializer automatically gets an implicit initializer derived from its instance properties. T
 - storage and memory management are easier
 */

struct Beverage {
    let brand: String
    var sizeInOz: Double
}

var coke = Beverage(brand: "Coca-Cola", sizeInOz: 8)
var greenTea = Beverage(brand: "ItoEn", sizeInOz: 16)
coke = greenTea
greenTea.sizeInOz = 100
print(greenTea.sizeInOz) //greenTea's size is 100
print(coke.sizeInOz) //coke's size is still 16
