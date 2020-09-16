
//: # 3_Struct Class - constructions
// + enum
// Tuple
//: [Classes And Structures](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
/*:
 Structures and classes in Swift have many things in common. Both can:
 * Define properties to store values - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
 * Define methods to provide functionality - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
 * Define subscripts to provide access to their values using subscript syntax - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
 * Define initializers to set up their initial state - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
 * Be extended to expand their functionality beyond a default implementation - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
 * Conform to protocols to provide standard functionality of a certain kind - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
 */

/*:
 Classes have additional capabilities that structures don’t have:
 * Inheritance enables one class to inherit the characteristics of another.
 * Type casting enables you to check and interpret the type of a class instance at runtime.
 * Deinitializers enable an instance of a class to free up any resources it has assigned.
 * Reference type
 * Reference counting allows more than one reference to a class instance.
 */

/*:
 All structures have an automatically generated memberwise initializer, classes - don't
 * Structures have value type
 */
import Foundation

// Value/Reference types
// Value:
var x = 10
var y = x
x = 5

// Reference:
class Ref {
    var x = 10
}

var xxx = Ref()
xxx.x
var yyy = xxx
yyy.x

xxx.x = 1
yyy.x

/*:
Properties
 */
struct CustomStruct {
    // properties
    var property: Int
    let constantProperty: Int = 0
    // initializers
    init() {
        self.property = 6
    }
    // methods
}
//CustomStruct(
CustomStruct()

class CustomClass {
    var property: Int
    let constantProperty: Int

    static var staticProperty = 10

    init() {
        self.property = 1
        self.constantProperty = 2
//        self
//        Self
    }

    func multiply() -> Int {
        return 4
    }
}
CustomClass().multiply()

class Cake {
    var color: Int

    lazy var lazyProperty: Int = {
        return 0
    }()

    var computedProperty: Int = {
        let one = 5
        let two = 10
        return one + two
    }()

    init(color: Int) {
        self.color = color
    }
}

let order = Cake(color: 0)
order.lazyProperty

let object = CustomClass()
object.property
CustomClass.staticProperty

class Empty {
    var property: Int = 6

    init(value: Int) {
        let one = 3
        let two = 3

        self.property = one + two
    }
}

Empty(value: 6)



//Stored properties - must be initialized when class or struct are initialized
// +Lazy
// +Optional
//
//Computed properties

// Stored properties in class and structs


//: Initialization


// what is self? Self?
class MyClass {
    static func staticMethod() {
    }

    func instanceMethod() {
//        self.instanceMethod()
        Self.staticMethod()
    }
}
// Swift provides a default initializer for any structure or class that provides default values for all of its properties and does not provide at least one initializer itself.
// .init
// Advanced - Designated Initializers and Convenience Initializers

//: Methods
//Instance
//Class(Static) Classes can use the class keyword instead, to allow subclasses to override the superclass’s implementation of that method.

//Override (class)

//Mutating (for structs) - Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.

//: Subscript
//for advanced



//: ## Задание:
//: * [App Development with Swift](https://books.apple.com/by/book/app-development-with-swift/id1465002990) **Units 1.1-1.4, 2.1-2.4** - Обязательно + тесты
//: * Подготовить интерпретацию иерархии видов животных в коде (класс-семейство-вид) подробно описать их свойства и функции
//: *
/*
 
 Here I'll try to introduce the basic state hierarchy of middle-ages countries
 
 */

class State {
    var name: String
    var nameOfTheRulingDynasty: String
    var currentRuler: String
    var religion: String
    
    var points: Int = 100
    
    init(name: String, nameOfTheRulingDynasty: String, currentRuler: String, religion: String) {
        self.name = name
        self.nameOfTheRulingDynasty = nameOfTheRulingDynasty
        self.currentRuler = currentRuler
        self.religion = religion
    }
    
    func defineReligion () -> String {
        switch religion.lowercased() {
            case "protestant", "reformed", "catholicism", "orthodox", "coptic" : return "Christianity"
            case "sunni", "shiite" : return "Islam"
            default : return "Fetishism"
        }
    }
    
    func headOfTheState () {
        print(currentRuler + " " + nameOfTheRulingDynasty)
    }
    
    
}

class Republic: State {
    var republicanTradition: Double
    var numberOfMerchants: Int
    
    init(name: String, nameOfTheRulingDynasty: String, currentRuler: String, religion: String, republicanTradition: Double, numberOfMerchants: Int) {
        self.republicanTradition = republicanTradition
        self.numberOfMerchants = numberOfMerchants
        super.init(name: name, nameOfTheRulingDynasty: nameOfTheRulingDynasty, currentRuler: currentRuler, religion: religion)
    }
    
    func isRepublicanDictatorship () -> Bool {
        if republicanTradition < 20.0 {
            return true
        }
        return false
    }
    
    func isMerchantRepublic () -> Bool {
        if numberOfMerchants > 2 {
            return true
        }
        return false
    }
    
    func reElect () {
        republicanTradition -= 10
        getPoints()
        
        if republicanTradition < 0 {
            republicanTradition = 0
        }
    }
    
    func getPoints() {
        super.points += Int.random(in: 12 ... 50)
    }
    
    override func headOfTheState() {
        print("President " + self.currentRuler + " " + self.nameOfTheRulingDynasty)
    }
}

class Monarchy: State {
    var legitimacy: Double
    var numberOfVassals: Int
    var numberOfRoyalMarriages: Int
    
    init(name: String, nameOfTheRulingDynasty: String, currentRuler: String, religion: String, legitimacy: Double, numberOfVassals: Int, numberOfRoyalMarriages: Int) {
        self.legitimacy = legitimacy
        self.numberOfVassals = numberOfVassals
        self.numberOfRoyalMarriages = numberOfRoyalMarriages
        super.init(name: name, nameOfTheRulingDynasty: nameOfTheRulingDynasty, currentRuler: currentRuler, religion: religion)
    }
    
    func royalMarriage () {
        numberOfRoyalMarriages += 1
        legitimacy -= 0.5
        
        if legitimacy < 0 {
            legitimacy = 0
        }
    }
    
    func addVassal (number: Int) {
        numberOfVassals += number
        legitimacy += Double(number * 5)
        
        if legitimacy > 100 {
            legitimacy = 100
        }
    }
    
    override func headOfTheState() {
        print("King " + self.currentRuler + " " + self.nameOfTheRulingDynasty)
    }
}

class AbsoluteMonarchy: Monarchy {
    var administrativeEfficiency: Double
    var discipline: Double
    
    override init(name: String, nameOfTheRulingDynasty: String, currentRuler: String, religion: String, legitimacy: Double, numberOfVassals: Int, numberOfRoyalMarriages: Int) {
        self.administrativeEfficiency = 0
        self.discipline = 0
        super.init(name: name, nameOfTheRulingDynasty: nameOfTheRulingDynasty, currentRuler: currentRuler, religion: religion, legitimacy: legitimacy, numberOfVassals: numberOfVassals, numberOfRoyalMarriages: numberOfRoyalMarriages)
    }
    
    func harshTreatment() {
        if super.points >= 50 {
            super.points -= 50
            administrativeEfficiency += 0.4
            discipline += 0.05
        }
        else {
            print("You're run out of points!")
        }
    }
}





var florence = Republic(name: "Florence", nameOfTheRulingDynasty: "de Medici", currentRuler: "Vasco", religion: "Protestant", republicanTradition: 18.4, numberOfMerchants: 4)
florence.isRepublicanDictatorship()
florence.reElect()
florence.headOfTheState()
florence.defineReligion()

var france = Monarchy(name: "France", nameOfTheRulingDynasty: "de Valois", currentRuler: "Louis", religion: "Catholicism", legitimacy: 95.0, numberOfVassals: 6, numberOfRoyalMarriages: 3)
france.headOfTheState()
france.royalMarriage()
france.addVassal(number: 1)

var sweden = AbsoluteMonarchy(name: "Sweden", nameOfTheRulingDynasty: "Pfalz", currentRuler: "Karl XII", religion: "Protestant", legitimacy: 100, numberOfVassals: 0, numberOfRoyalMarriages: 2)
sweden.harshTreatment()
sweden.discipline
sweden.headOfTheState()
