import UIKit

/*
 - Object-oriented programming helps you structure your Swift code with classes. Classes have properties and methods, and class can inherit attributes from each other. Object-oriented programming structures your code like a house. You define the code’s foundation, and build on top of that, room by room, one building block at a time.
 - Instances of a class are called objects.
 - Inheriting/subclassing
 - final class marks it so that others cannot subclass it
 - open marks it so that others can subclass it e.g. open class Instrument
 - Methods can be marked open to allow overriding
 - Methods can be marked final so no one can override them.
 
 What are the main principles of Object-Oriented Programming?
 
 1. Encapsulation
 * Class types encapsulate data and behavior
 * When each object keep its state private inside a class so that other objects don’t have direct access to this state. They can only call a list of public functions or methods to change the state.
 * E.g. Cat has a private method to meow(), but other objects cannot call that directly. We can call the cat to play() as a public method which will invoke the cat to meow().
 
 
 2. Abstraction
 * Each object should only expose a high-level mechanism for using it. This mechanism should hide internal implementation details. It should only reveal operations relevant for the other objects.
 * E.g. coffee machine, we should be able to put coffee and press a button to start making the coffee. We don’t need to know what’s going on under the hood.
 * E.g. phone. We interact only by pressing a few buttons. What’s going on behind the screen are hidden. You only need to know a short set of actions.
 
 
 3. Inheritance
 * Sometimes objects are often very similar. They share common logic but they’re not entirely the same. To reuse the common logic and extract the unique logic into a separate class, we use inheritance.
 * Child class inherit from parent class forming a hierarchy. Child class reuse all fields and methods of the parent class and can implement its own unique part.
 * E.g. Person -> student, teacher -> private, public.
 
 
 4. Polymorphism
 * Polymorphism gives a way to use a class exactly like its parent so there’s no confusion with mixing types, but each child class keeps its own methods as they are.

 */
