# Harvard-CS50-iOS-Track
This is CS50 iOS Track, Harvard University's introduction to iOS Development.

## [Lesson 01](https://youtu.be/7IaM0ZN1i7Q)

Xcode is the IDE made by Apple that we’ll use to write our apps, and it includes all the tools we’ll need, though it is only available for macOS.
Newer iOS apps are generally written in a language called Swift, though some use an older language, Objective-C.
[0:37] Swift is similar to C, but there are some differences.
When declaring variables, we can set them to be constant (immutable) with let, or mutable with var. This will help protect us from accidentally changing values that should remain constant.
Data types include:
Array
Bool
Dictionary
Int
Double, Float
Set
String
We take a look at a few snippets of syntax for conditions, arrays, dictionaries, and string interpolation, or substituting variables in strings.
[7:23] We see function declarations, like func sayHello(name: String) -> String { ... }, where we use the func keyword to declare the function name, and then the parameter(s) and the return value. When we call the function, we also need to include the name of the parameter we’re specifying, with sayHello(name: "Tommy").
Structs also exist, acting as a container for data, with multiple fields of different types that we can specify.
Classes are like structs, but can also have functions. For example, we might have a class Person that has a special function, or method, called init, to create one instance of the Person class. The instances are commonly referred to as an object.
We can add another method to our class, like sayHello(), and after we create an instance of it with let person = Person(name: "Tommy"), we can call it with person.sayHello(). This time, our function doesn’t need a parameter for name, since our instance can use the name we passed in when we created it.
[13:34] With inheritance, we can create a subclass of a given class, which will by default include the methods of the class it inherits from. But we can override any of those methods to do something different with override func.
[16:01] Protocols, or interfaces in other languages, are like a list of methods that a class must implement. In a protocol, we don’t specify how the function is implemented, but just that it needs to exist on any class using it. This helps our compiler help us be sure that our classes can be used as we would expect.
[17:53] Optionals, which we can declare with something like var name: String?, allow us to declare variables that might have the value of nil, the equivalent of a null value. To use this variable, we need to then check that it’s not nil, with if let n = name (which we can think of as if (name != null)). Then, inside the condition, we’ll know that we can use n as a string. Again, this helps the compiler help us avoid mistakes. (Though, we can bypass that with using the variable as name!, by adding an exclamation point.)
[21:14] We can also use a guard clause, with the syntax guard let n = name else, which sets the variable n to name if name is not nil, and continues outside of the condition. If name is nil, then the else branch will run, perhaps returning with a special message.
[23:01] We can open Xcode, and click on “Create a new Xcode project”. We’ll go to the macOS tab, and choose the “Command Line Tool” template to get started with Swift. We’ll have a few details about our project to fill out, and we can use “CS50” as the Organization Name and “edu.harvard.cs50” as the Organization Identifier (the domain name backwards, by convention). (If we wanted to actually publish an app to the App Store, we’ll need to get our own account from Apple.) And we’ll be sure Swift is the selected language.
The main screen will be our code editor, and the left side will show the files in our project. We can also change some settings on the right side.
We can open the file main.swift, and see that there’s already some generated code for us. In the top left, we can compile and run our code with the triangular play button. In the bottom we have the output of our program, as though we ran it in the terminal.
[27:34] We can write an example program that sorts students into tracks, with a class, a constructor for the class called init, and an array of instances of the class.
Xcode has autocomplete, so as we type it’ll suggest types and highlight anything we might be doing incorrectly.
We create an array of student names, and a dictionary where the keys are the names of the students (strings) and the values are tracks.
Then, we iterate through our student array, pick a random track, and store it in our dictionary. Finally, we iterate over our dictionary and print out each student and their assignment.

##
[Harvard CS50 - iOS Track](https://cs50.harvard.edu/x/2020/tracks/mobile/ios/)
