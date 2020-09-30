/*:
 # Look back:
 * If, guard, switch
 * Optionals
 * Struct, Class
 * Types
 *

 */

//enum Move {
//    case go(Int)
//    case turn(Direction)
//
//    enum Direction {
//        case left, right, turnBack
//    }
//}
//
//let movement = Move.go(3)
//
//switch movement {
//    case .go(let numberOfSteps):
//        for _ in 0...numberOfSteps {
//            //move()
//        }
//    case .turn(let direction):
//
//}

/*:
 # Lecture 7
 # Functions, Closures

 * Введение в функции и замыкания
*/

//: ## Functions
// Define
func functionName (id index: Int, param2: Double) -> Int {
  //body of the function
    return index
}

var function = functionName
var result = functionName(id: 1, param2: 12.1)
function(1, 1.2)

functionName(id: 1, param2: 1)


func printOnScreen(_ value: Int = 1) {
    print(value)
}
printOnScreen(11)

func fullTank(amount: Double = 100.0) {

}

fullTank()

class CustomType {}

func configureInterface(config: CustomType? = nil) {

}

configureInterface()
configureInterface(config: CustomType())


func color (_ red: Int? = 1, _ green: Int? = 1, _ blue: Int? = 1) -> (Int, Int, Int) {
    guard let red = red,
        let green = green,
        let blue = blue else {
            return (0, 0, 0)
    }

//    return red + green + blue
    return (red, green, blue)
}
var colorComponent: Int? = nil
let variable = functionName(id: 1, param2: 1.5)
color()


struct CustomStruct {
//    var
//    let
    func shortAction() {

    }
    static func internalFunc() {
//        shortAction()
    }
}

var customStructVar = CustomStruct()
customStructVar.shortAction()
CustomStruct().shortAction()
CustomStruct.internalFunc()

// Parameters

// Default value

// Return value

// inout

func multiplyOnTen(value: inout Int) {
    value *= 10
}

var givenValue = 5
multiplyOnTen(value: &givenValue)
givenValue
import Foundation

func resolveString(text: inout String) {
    let placeholder = "{APP_VERSION}"
    let version = "v0.0.1"
    text = text.replacingOccurrences(of: placeholder, with: version)
}

var givenText = "Jan 23, 2019 - In Swift 2 the use of split becomes a bit more complicated due to the ... componentsSeparatedByString() // And then to access the individual words: {APP_VERSION} Jan 23, 2019 - In Swift 2 the use of split becomes a bit more complicated due to the ... componentsSeparatedByString() // And then to access the individual words: v"
resolveString(text: &givenText)
givenText

//var multiplyResult = multiplyOnTen(value: 5)

//: ## Closures
//: [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
var customClosure: (Int, Double) -> Int = { (intValue, doubleValue) -> Int in
    print(intValue)
    print(doubleValue)
    return intValue + Int(doubleValue)
}
//func functionName (id index: Int, param2: Double) -> Int {
//    return index
//}
var customClosureShort: () -> Void = {
    print("Hello world!")
}
customClosureShort()
let constantClosure = customClosureShort
constantClosure()

var cCShortening: (Int, Double) -> Int = { $0 + Int($1) }


//{ (parameters) -> return type in
//    statements
//}
//typealias MyClosure = (Int, String) -> Void
//var customClosure: (Int, String, Double) -> Void = {
//    print("closure is called")
//    print($0)
//    print($1)
//    print($2)
//}
//var newClosure = customClosure
//newClosure(1, "Hello", 1.0)
//
//var oneMoreClosure: MyClosure = { myInteger, myString in
//
//}

func operation(arg1: Int, arg2: Int, closure: (Int, Int) -> Void) {
    closure(arg1, arg2)
}

let handler1: (Int, Int) -> Void = {
    print($0 * $1)
}

operation(arg1: 5, arg2: 5, closure: handler1)

operation(arg1: 7, arg2: 7, closure: { (arg1, arg2) in
    print(arg1 + arg2)
})

operation(arg1: 12, arg2: 12) {
    print($0 * $1)
}

var array = [1, 2, 3]
array.reduce(0) { (result, intValue) -> Int in
    result + intValue
}

// Same implementation:

let handler3: (Int, Int) -> Int = {
    $0 + $1
}
var result1 = 0

for element in array {
    result1 = handler3(result1, element)
}

array.reduce(0, +)

//array.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
//array.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)

//: ### Homework:

//1. Write a Swift program to check if two given arrays of integers have 0 as their first element.
//произвести проверку двух массивов(Int) являются ли их первые элементы нулями и вывести соответствующее сообщение в консоль.

func checkForZero (firstArray: [Int], secondArray: [Int]) {
    if firstArray.first == 0 && secondArray.first == 0 {
        print("Both arrays have zeros as their first value")
    }
    else if firstArray.first == 0 && secondArray.first != 0 {
        print("Only first array has zero as his first value")
    }
    else if firstArray.first != 0 && secondArray.first == 0 {
        print("Only second array has zero as his first value")
    }
    else {
        print("Both arrays don't have zeros as their first value")
    }
}
var firstArray: [Int] = [0, 5, 54]
var secondArray: [Int] = []

checkForZero(firstArray: firstArray, secondArray: secondArray)

//2. Write a Swift program to test if an array of integers does not contain a 3 or a 5.
//произвести проверку двух массивов(Int) на отсутствие в них элементов 3 и 5 и вывести соответствующее сообщение в консоль

//I'll take second option

func checkForElements (firstArray: [Int], secondArray: [Int]) {
    if firstArray.contains(where: { $0 == 3 || $0 == 5 }) || secondArray.contains(where: { $0 == 3 || $0 == 5 }) {
        print("These arrays contain 3 or 5")
    }
    else {
        print("Both arrays don't have 3 or 5")
    }
}

checkForElements(firstArray: firstArray, secondArray: secondArray)

//3. Write a Swift program to check whether the first element and the last element of a given array of integers are equal.
//произвести проверку одинаковы ли первый и последний элементы данного массива(Int) и вывести соответствующее сообщение в консоль

func firstEqualLast (array: [Int]) {
    guard array.first == array.last else { return print("First and last element of given array aren't equal") }
    print("First and last element of given array are equal")
}
firstEqualLast(array: firstArray)

//4. Write a Swift program that creates Array, adds an item, remove item, modify item and then prints size of the array.
//проинициализировать массив, добавить в него элемент, удалить элемент, модифицировать какой-нибудь элемент и вывести в консоль размер массива(количество элементов)

var someArray: [Double] = [15.6, 54.8, 22.7]
someArray.append(13.8)
someArray.remove(at: 2)
someArray[1] = 56.8
print(someArray.count, someArray)

//5. Write a Swift program that creates Dictionary, adds an item, remove item, modify item and then prints size of the Dictionary.
//проинициализировать словарь, добавить в него элемент, удалить элемент, модифицировать какой-нибудь элемент и вывести в консоль размер словаря(количество элементов)

var someDictionary: [Double: String] = [13.4:"13.4", 18.7:"18.7", 56.8:"56.8"]
someDictionary[14.8] = "14.8"
someDictionary.removeValue(forKey: 56.8)
someDictionary[18.7] = "15.7"
print(someDictionary.count, someDictionary)

//6. Write a Swift program that creates Set, adds an item and then prints size of the Set.
////проинициализировать Сет, добавить в него элемент и вывести в консоль размер Сета(количество элементов)

var fruit: Set = ["Banana", "Mango", "Pineapple"]
fruit.update(with: "Lime")
print(fruit.count, fruit)

//7. Create 2 arrays, and merge them.
//проинициализировать 2 массива и объединить(можно в новом массиве)

var fruitArray: [String] = ["Banana", "Mango", "Pineapple"]
var vegetablesArray: [String] = ["Pumpkin", "Tomato", "Potato"]

var plantsFood = fruitArray
plantsFood.append(contentsOf: vegetablesArray)
print(plantsFood)


//8. Write a closure to sum 2 integers, pass closure as argument to function, where return the result of calling that closure.
//Написать замыкание(closure), задача которого складывать 2 полученных аргумента типа Int и вернуть его и вывести в консоль.

var sumClosure: (Int, Int) -> Int = { $0 + $1 }

func sumTwoInts (firstInt: Int, secondInt: Int, closure: (Int, Int) -> Int) -> Int {
    return closure(firstInt, secondInt)
}

print(sumTwoInts(firstInt: 5, secondInt: 87, closure: sumClosure))

//9. Подготовить примеры:
// array.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
    
var uppercasedFruit = fruitArray.map { $0.uppercased() }
print(uppercasedFruit)

var vegetableThatContainPump = vegetablesArray.map { $0.lowercased().contains("pump") }
print(vegetableThatContainPump, type(of: vegetableThatContainPump))

// array.filter(<#T##isIncluded: (Int) throws -> Bool##(Int) throws -> Bool#>)

var randomLuckyFruit = fruitArray.filter { $0 == fruitArray.randomElement()}
print(randomLuckyFruit)

var fourthElementGreaterThanC = vegetablesArray.filter { $0[$0.index($0.startIndex, offsetBy: 3)].lowercased() > "c"}
print(fourthElementGreaterThanC)
