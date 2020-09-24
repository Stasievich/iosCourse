import UIKit

/*:
 # Вспомним:
 * Синтаксис IF-ELSE
 * Синтаксис GUARD
 * Синтаксис TERNARY
 * Синтаксис SWITCH
 * Switch + break, fallthrough
 * ENUM - https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html

*/
let isIpad = true
let new = isIpad ? 10 : 20

switch new {
    case 0...10:
        print("1")
        fallthrough
    case 10...20:
        print("2")
    case 0...100:
        print("3")
    default:
        break
}
//raw value
enum Payment1: Int {
    case cash = 1
    case gold = 20
    case berries = 30
}

Payment1(rawValue: 20)

typealias Weight = Double

//associated value
enum Payment {
    case cash (Double)
    case gold (Weight)
    case berries (Int, Int)
}

let goldPayment = Payment.gold(100)
let paymentType = Payment1.gold
let paymentAmount = 100

let newPayment = Payment.cash(1000.5)


func getPayment(payment: Payment) {
    switch payment {
        case .cash(let value):
            print("Get cash: \(value)")
        case .berries(var x, let y):
            print("berries")
        case .gold(var xxx):
            print("Get gold: \(xxx)")
    }
}
getPayment(payment: goldPayment)


/*: ## Switch advanced
 * switch + value binding
 */

/*:
 # 5 Enumerations + Optionals

 * ENUM advanced - https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
 * Optionals
*/
enum CustomOptional<T> {
    case some (T)
    case none
}

enum AnyOptional {
    case some (Any)
    case none
}

struct SSS {
}

let co = CustomOptional.some(0.0)
let ao = AnyOptional.some(0.0)


//: ## Enum

// CaseIterable
//enum Beverage: CaseIterable {
//    case coffee, tea, juice
//}

//for beverage in Beverage.allCases {
//    print(beverage)
//}

// Raw values
//enum Planet: Int {
//    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
//}
//let possiblePlanet = Planet(rawValue: 7)


/*:
 ## Optionals
 * [Documentation](https://developer.apple.com/documentation/swift/optional)
 * [Source code](https://github.com/apple/swift/blob/master/stdlib/public/core/Optional.swift)
 ### What is optional?
 */
var optionalInt: Int? = 0

switch optionalInt {
    case .some(let value):
        print(value)
    case .none:
        break
}


print(optionalInt)

func printNonOptional(value: Int){
    print(value)
}

//: ### Unwrapping
//what is unwrapping

//:* using if-statement
var result: Int = 0
//result = optionalInt + 1

if let nonOptional = optionalInt {
    nonOptional
} else {
    print("Warning! No data")
}
//nonOptional
func method() {
    guard let nonOptional = optionalInt else { return }

    print(nonOptional)
}

func sellItemFor(money: Double?) {
    guard let money = money else { return }

    if money < 10 {
        // sell 1
    } else {

    }
}

//: * Optional binding
//if let
if let nonOptional = optionalInt {
    printNonOptional(value: nonOptional)
} else {
//    nonOptional
}

// Caution! Careful with structs

//guard let
optionalInt = 11
func guardlet() {
    guard let nonOptional = optionalInt else {
        return
    }
    nonOptional
}

guardlet()
//: * Optional chaining
if let optInt = optionalInt {
    optInt.distance(to: 100)
}

optionalInt?.distance(to: 100)


class Cat {
    var numberOfLegs: Int? = 4
    func bite() {
        print("Bite")
    }
}

var myCat: Cat? = Cat()
myCat?.bite()
//myCat = nil
myCat?.bite()
myCat?.numberOfLegs?.distance(to: 1)

//: * nil-coalescing operator
print(optionalInt ?? "there is nil")
let nonOptional2 = optionalInt ?? 555


let newInt: Int = optionalInt ?? 0

//: * Force(unconditional) unwrap
let nonOptionalForced = optionalInt!

if optionalInt != nil {

}

if let nonOpt = optionalInt {
    print("smth")
}

let newInt2 = optionalInt!






//: ## Задание:
//: * [App Development with Swift](https://books.apple.com/by/book/app-development-with-swift/id1465002990) **Units 1.1-1.4 + Units 2.1-2.5**

//: ### Практика:
// 1. Придумать ENUM к которому можно применить rawValue (не Error), другой к которому можно применить Associated Values (не из примеров с занятия)
// 2. Создать опционалы типов Int, Double, String + какого-то своего класса, а также применить все виды разворачивания: Optional Binding, Optional chaining, nil-coalesing (??)
// 3. Описать с помощью ENUM погодные явления, сопроводить(где возможно) associated values

//: ### Advanced:
//: * https://www.hackerrank.com/


// 1. Придумать ENUM к которому можно применить rawValue (не Error), другой к которому можно применить Associated Values (не из примеров с занятия)

enum MusicalInstruments: Int {                                  //rawValue
    case guitar = 3
    case violin = 5
    case flute = 1
    case piano = 26
}

var instrument = MusicalInstruments.guitar
print(instrument)
print(instrument.rawValue)
if let instr = MusicalInstruments(rawValue: 5){
    instrument = instr
}
print(instrument)


enum BookProgress {                                             // Associated Values
    case percentRead (Double)
    case listsRead (Int)
    case illustrationsWatched (Int)
}

let someProgress = BookProgress.percentRead(37.5)

func getProgress(progress: BookProgress) {
    switch progress {
    case .illustrationsWatched(let value):
        print("You've watched \(value) illustrations!")
    case .listsRead(let value):
        print("You've read \(value) lists!")
    case .percentRead(let value):
        print("You've read \(value) percent of the book!")
    }
}
getProgress(progress: someProgress)


// 2. Создать опционалы типов Int, Double, String + какого-то своего класса, а также применить все виды разворачивания: Optional Binding, Optional chaining, nil-coalesing (??)

//Int

func printThatInt (someInt: Int?) {             //Optional Binding
    if let value = someInt {
        print(value)
    }
    else {
        print("We have a problem")
    }
}

printThatInt(someInt: nil)

var someInt: Int?                               //Optional Chaining
someInt = -11
if let desire = someInt?.signum() {
    print(desire)
}
else {
    
}

var kos = someInt ?? 67                         //Nil-coalescing
someInt = nil
kos = someInt ?? 67

//Double

func printThatDouble (someDouble: Double?) {             //Optional Binding
    if let value = someDouble {
        print(value * 2)
    }
    else {
        print("We have a problem")
    }
}

printThatDouble(someDouble: 35.7)

var someDouble: Double?                               //Optional Chaining
someDouble = -11.8
if let desire = someDouble?.magnitude {
    print(desire)
}
else {
    
}

var kosDouble = someDouble ?? 67.7                       //Nil-coalescing
someDouble = nil
kosDouble = someDouble ?? 67.7

// String

func printThatString (someString: String?) {             //Optional Binding
    if let value = someString {
        print("We have a \(value)!")
    }
    else {
        print("We have a problem")
    }
}

printThatString(someString: "cool")

var someString: String?                               //Optional Chaining
someString = "-11 ham"
if let desire = someString?.precomposedStringWithCanonicalMapping {
    print(desire)
}
else {
    
}

var kosString = someString ?? "Boxes of bush"                         //Nil-coalescing
someString = nil
kosString = someString ?? "Boxes of bush"


// My class

class Guitar {
    var numberOfStrings: Int?
    var type: String?
    
    init? (_ numberOfStrings: Int, _ type: String){
        if numberOfStrings < 1 { return nil }
        self.numberOfStrings = numberOfStrings
        self.type = type
    }
    
    func guitarInfo () {                                                //Optional Binding
        if let strings = numberOfStrings, let t = type {
            print("This guitar is \(t) and has \(strings) strings")
        }
        else {
            print("We don't have such guitar")
        }
    }
    
    func tearString() {
        var newNumberOfStrings = numberOfStrings ?? 1                   //Nil-coalescing
        if newNumberOfStrings > 0 {
            newNumberOfStrings -= 1
            numberOfStrings = newNumberOfStrings
        }
    }
}

var someGuitar = Guitar(4, "Acoustic")
someGuitar?.guitarInfo()                                                //Optional Chaining

someGuitar?.tearString()
if let number = someGuitar?.numberOfStrings {
    print(number)
}


// 3. Описать с помощью ENUM погодные явления, сопроводить(где возможно) associated values


struct roadVisibility {
    var visibility: Double
    var temperature: Double
}

enum Weather {
    case wind
    case cloud (roadVisibility)
    case rain (roadVisibility)
    case snow (roadVisibility)
    case fog (roadVisibility)
    case dustStorm (roadVisibility)
    case defaultSun
}


func tryToForecastWeather (visibility: roadVisibility?) -> Weather{
    guard let vision = visibility else { return .defaultSun }
    
    if vision.temperature > 0  && vision.visibility < 20{
        return .dustStorm(vision)
    }
    else if vision.temperature > 0  && vision.visibility < 40 {
        return .fog(vision)
    }
    else if vision.temperature > 0  && vision.visibility < 60 {
        return .rain(vision)
    }
    else if vision.temperature > 0  && vision.visibility < 100 {
        return .cloud(vision)
    }
    else if vision.temperature <= 0  && vision.visibility < 40 {
        return .snow(vision)
    }
    return .wind
}
var visio = roadVisibility(visibility: 17.7, temperature: 5)
var someWeather = tryToForecastWeather(visibility: visio)
