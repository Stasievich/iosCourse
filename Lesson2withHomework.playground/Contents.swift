
/*:
# iOS Development
by **Vadim Zhuk**
## Lecture 2 - TYPES
 * Typization - what is it?
 * Basic types
 * Basic operators
*/

/*:
# Constants and Variables
* let - constant
* var - variable
*/
// what is a SCOPE?
var variable: Int = 0

// value type vs. reference type

var variable1 = 0
var variable2 = variable1
variable1 = 1
variable2

/*:
 ## INTEGERS
*/
// https://developer.apple.com/documentation/swift/int
// Int, UInt

let constInteger: Int = 10 // Int type
constInteger
//constInteger = 1 // Cannot assign to value: 'constInteger' is a 'let' constant

let intMax = Int.max // max value of Int
let intMin = Int.min // min value of Int

var constMaxUInt: UInt = UInt.max // UInt - Unsigned Integer - only positive values
constMaxUInt
// UInt has same range as Int, but only positive

let newConstInteger = constInteger // Initialize new constant with value of constInteger

var varInteger: Int = constInteger // Initialize new variable with value of constInteger


/*:
 ## Floating-Point Numbers:
 ### FLOAT
 ### DOUBLE
*/
// https://developer.apple.com/documentation/swift/double

var double1: Double = 55 // new variable of type Double with value 55.0
var double2 = 0.0
var casted = Double(varInteger) // type-casting from Int to Double
//var double3: Double = varInteger

0.000000 //float
0.000000000000000 //double

/*:
 # Type BOOLEAN
 */

// https://developer.apple.com/documentation/swift/bool

var boolean: Bool = false // just true or false
var negativeBoolean: Bool = !boolean
varInteger = 15
var varInteger1 = varInteger + 1
var result: Bool = varInteger > varInteger1 // Boolean

/*:
# Types STRING, CHAR
*/

// https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
// https://developer.apple.com/documentation/swift/string
var string: String = "iOS Development🧑‍💻" //
var string2: Character = "M"
var stringID = "ID1"
var stringCode = "14"
var stringYear = "20"
print(type(of: string))
//print(string+"\n"+string2+"-"+stringID+"-"+stringCode+"-"+stringYear) // Concatenation string
print("String \(string)")
/*:
 # BASIC OPERATORS
 */
// https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html
// Unary
// Bynary
// Ternary

// = - assignment operator
varInteger = 55 // set new value to varInteger

// Arithmetic operators:
// Addition (+)
// Subtraction (-)
// Multiplication (*)
// Division (/)
// Remainder (%)
var integer1 = 1
var integer2 = 2
var integer3 = integer1 + integer2
integer1 += 1
integer1 / integer2
//Double(integer1) / Double(integer2)
integer1 % integer2


varInteger + 1 // operator + doesn't set the value - use operator with assignment
varInteger1 = varInteger + 1
var multiply = varInteger1 * varInteger
var division = varInteger / 12
var rest = varInteger % 12

//Arithmetic with Assignment:
// +=
varInteger += 200 // varInteger = varInteger + 200
// -=
varInteger -= 200
// *=
varInteger *= 2
// /=
varInteger /= 2
// %=
varInteger %= 15

//Comparison(logic):
//Equal to (a == b)
boolean = integer1 == integer2
//Not equal to (a != b)
//Greater than (a > b)
//Less than (a < b)
//Greater than or equal to (a >= b)
//Less than or equal to (a <= b)

varInteger == varInteger1 //the result is always true or false - that is boolean type
varInteger != varInteger1
varInteger >= varInteger1
// >
// <
// <=
// >=

var integer4 = boolean ? true : false
//var integer4: Bool
//if boolean == true {
//    integer4 = true
//} else {
//    integer4 = false
//}

/*:
 # LINKS:
 * [Swift by Apple](https://developer.apple.com/documentation/swift)
 * [Swift Docs - Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
 * [Swift Guidelines](https://swift.org/documentation/api-design-guidelines)
 */

/*:
 # ЗАДАНИЕ:
*/
// В конспекте (файле Playground):
// 1. Проинициализируйте константы типа Int, Double, String, Bool, не задавая тип явно

let year = 1444
let siegeAbility = 33.3
let dynasty = "Habsburg"
let doesHeHaveAnHeir = true

// 2. Проинициализируйте переменные типа Int, Double, String, Bool, явно задав тип

var cost: Int = 150
var fortDefense: Double = 25.7
var buildingName: String = "Marketplace"
var isWarDeclared: Bool = false

// 3. Проинициализируйте переменную типа Int со значением, равным сумме созданной константе и переменной в п.1-2

var sum = year + cost

// 4. Задайте новое значение переменной, созданной в п.3, равное произведению константы из п.1 и переменной из п.2

sum = year * cost

// 5. Объявите(не инициализируя) переменные типов Int, Double, String

var stability: Int
var tradePower: Double
var rulerName: String

// 6. Проинициализируйте переменную типа Bool с результатом сравнения константы из п.1 и переменной из п.2

var comparison: Bool = doesHeHaveAnHeir == isWarDeclared

// 7. Проинициализируйте переменую типа String с каким-либо значением

var idea: String = "élan"

// 8. Взять модуль из переменной типа Int, реализовать округление переменной типа Double

var signedInt: Int = -100
var absSignedInt =  abs(signedInt)

var someDouble: Double = 35.67
var roundSomeDouble = someDouble.rounded()
var newRound = Double(someDouble * 10).rounded() / 10               // Rounded with 0.1 precision

