
//: # 1. (1 балл за каждый пункт)

//: ### 1.1 Что такое значимый (value) и  ссылочный(reference) тип? Приведите примеры.
//Value type - тип данных, где каждый экземпляр хранит уникальную копию своих данных (struct, enum, tuple, double)
//Reference type - тип данных, где экземпляры разделяют одну копию данных (class)
//: ### 1.2 Чем отличается “struct“ от “class”?
//Kласс отличается от структуры тем, что:
//a) можно наследовать один класс от другого;
//b) деинициализаторы освобождают ресурсы от объектов класса;
//c) на один и тот же объект может ссылаться несколько переменных.
//: ### 1.3 Что такое Опционал(optional value)? Какие способы “unwrapping” для опционала вы знаете?
//Optional value - тип данных, который может содержать либо значение, либо отсутствие значения(nil)
//Unwrapping methods:
//a) guard statement
//var age: Int? = nil
//guard let someInt = age else { throw fatalError("Bad Int") }
//print(someInt + 2)

//b) if let statement , optional binding
//var age: Int? = nil
//if let someInt = age {
//    print(someInt + 2)
//}

//c) force unwrap with "!"
//var age: Int? = nil
//var someInt = age!
// it crashes if we unwrap nil value

//d) optional chaining
//var someDouble: Double?
//someDouble = -11.8
//if let desire = someDouble?.magnitude {
//    print(desire)
//}


//: ### 1.4 Какие Коллекции(Collection types) вы знаете? Приведите примеры использования каждого из них(т.е. какую коллекцию для каких задач рациональнее использовать).
//a) Array
//var days: [String] = ["Monday", "Tuesday"]
//days.append("Wednesday")
//days.count
//days.insert("Sunday", at: 2)
//print(days)

//b) Dictionary
//var elements: [String: Double] = ["Hydrogen": 1.0, "Helium": 4.0]
//elements["Helium"] = 6.0
//for i in elements {
//    if i.key.lowercased().first == "h" {
//        if let newValue = elements[i.key] {
//            elements[i.key] = newValue * 2
//        }
//    }
//}
//print(elements)
//let nameElements = [String](elements.keys)

//c) Set
//var someSet: Set<Int> = [4, 8, 15, 16, 23]
//someSet.insert(42)
//someSet.remove(8)
//if someSet.contains(15) {
//    print("GreatWork")
//}
//: ### 1.5 Что такое замыкание(Closure)? Приведите примеры использования.
//Closure - блок кода, который может быть вызван какой-нибудь функцией и выполнен
//a)
var sumClosure: (Int, Int) -> Int = { $0 + $1 }

func sumTwoInts (firstInt: Int, secondInt: Int, closure: (Int, Int) -> Int) -> Int {
    return closure(firstInt, secondInt)
}
print(sumTwoInts(firstInt: 5, secondInt: 87, closure: sumClosure))

//b)
var vegetablesArray: [String] = ["Pumpkin", "Tomato", "Potato"]
var fourthElementGreaterThanC = vegetablesArray.filter { $0[$0.index($0.startIndex, offsetBy: 3)].lowercased() > "c"}
print(fourthElementGreaterThanC)

//: ### 1.6 Что такое enum? Что такое raw и associated value?
//Enum - перечисления, общий тип для группы ассоциативных значений
//Raw value - default values for enum cases
//enum Books: String {
//    case math = "Math Analysis"
//    case psichology = "Psichology Book 3000"
//    case physics = "Newton mechanics"
//}

//Associated value - additional information about enum cases
//enum Fruit {
//    case lemon(String)
//    case plum(String)
//    case banana(Int)
//}
//let iWannaFruit = Fruit.banana(32)
//: ### 1.7 Как вы понимаете основные понятия/принципы ООП: Наследование, инкапсуляция, полиморфизм? Приведите примеры.
//наследование - механизм, который позволяет написать новый класс на основе существующего, свойства и функциональность родительского заимствуется
//инкапсуляция - ограничение доступа к данным и и возможностям их изменения
//полиморфизм - возможность работы с несколькими типами так, будто это один тип. при этом поведение объектов будет разным, в зависимости от типа, к которому они принадлежат


class MusicalInstruments {
    
    var manufactorer: String
    private var instrumentId: Int
    
    init(_ manufactorer: String, _ id: Int){
        self.manufactorer = manufactorer
        self.instrumentId = id
    }
    
    func printInfo() {
        print("This musical instrument is  manufactured by \(manufactorer)")
    }
}

class Piano: MusicalInstruments {
    private var numberOfPedals: Int
    private var numberOfKeys: Int
    
    init (_ numberOfPedals: Int, _ numberOfKeys: Int, _ manufactorer: String, _ id: Int){
        self.numberOfPedals = numberOfPedals
        self.numberOfKeys = numberOfKeys
        super.init(manufactorer, id)
    }
    override func printInfo() {
        print("This musical instrument is  manufactured by \(manufactorer). Also it has \(numberOfPedals) pedals and \(numberOfKeys) keys!")
    }
}

class Guitar: MusicalInstruments {
    private var type: String
    private var numberOfStrings: Int
    
    init (_ type: String, _ numberOfStrings: Int, _ manufactorer: String, _ id: Int){
        self.type = type
        self.numberOfStrings = numberOfStrings
        super.init(manufactorer, id)
    }
    override func printInfo() {
        print("This musical instrument is  manufactured by \(manufactorer). Also it has \(numberOfStrings) strings and belongs to \(type) group!")
    }
}
//: ### 1.8 Для чего существуют операторы "if" и "switch"? Чем они отличаются?
//if and switch statements - для выполнения части кода при определенном условии
//let someInt = 5
//if someInt < 5 {
//    print("SomeInt is lesser than 5")
//}
//else if someInt == 5 {
//    print("SomeInt equals to 5")
//}
//else {
//    print("SomeInt is greater than 5")
//}
//
//switch someInt {
//    case ..<5: print("SomeInt is lesser than 5")
//    case 5: print("SomeInt equals to 5")
//    default: print("SomeInt is greater than 5")
//}
//: ### 1.9 Что такое Extension и Protocol. Для чего они предназначены? Какие принципы ООП они реализовывают?
//Extension - добавление новой функциональности существующему типу класса, структуры, перечисления
//Protocol - образец методов свойств, которые соответствуют определенному конкретному заданию или какой-то функциональности
//Затрагивают все принципы ооп
//: # 2. (2 балла за каждый пункт)
//:  2.1 Опишите enum который будет отражать общие состояния погоды(ясно, облачно, осадки и тд). Для тех состояний погоды, для которых возможно, опишите assosiated values с количеством осадков.
enum weather {
    case rain(Int)
    case sun
    case snow(Int)
    case cloud
    case wind
    case dustStorm
}

let someWeather = weather.rain(4)
someWeather
//:  2.2 Опишите функцию minValue, которая принимает 2 аргумента и возвращает меньшее из этих значений.
func minValue(_ firstValue: Double, _ secondValue: Double) -> Double {
    return min(firstValue, secondValue)
}

minValue(4.2, 5.6)
//:  2.3 Для следующего объекта типа String выведите все строки короче 10 символов, которые начинаются на "a" или "A" и все строки начинающиеся на b или "B"
let strings = ["adfkjsd", "Akdsfjkdfjldfjk", "bdkk", "kaf", " afurl", "ABBA", "ABBBBBBBBBBBBBBBBA", "no", "1234566dkjdksdjksd", "bbbbbbbbbbbbbbbbbbbb", "Ваc?"]
print(strings.filter({
    ($0.lowercased().first == "a" || $0.lowercased().first == "b") && $0.count < 10
}))
//:  2.4 Опишите функцию, которая принимает номер дня недели и возвращает название дня недели.
func getDay (number: Int) -> String {
    switch number {
    case 1: return "Monday"
    case 2: return "Tuesday"
    case 3: return "Wednesday"
    case 4: return "Thursday"
    case 5: return "Friday"
    case 6: return "Saturday"
    case 7: return "Sunday"
    default: return "You passed wrong number!"
    }
}

getDay(number: 5)
//:  2.5 Опишите функцию, которая получает время в качестве трех аргументов (часы, минуты, секунды) и возвращает время в качестве (с тремя этими компонентами). С помощью typealias можете назвать исходящий тип по-своему.
typealias TimeTuple = (Int, Int, Int)
func getTimeTuple (_ hours: Int, _ minutes: Int, _ seconds: Int) -> TimeTuple {
    return (hours, minutes, seconds)
}
let time = getTimeTuple(13, 23, 11)
//: 2.6 Опишите функцию, принимающую время в виде кортежа, описанного в предыдущем задании, конвертирует полученное время в секунды и возвращает значение Int(количество секунд)
func timeIntoSeconds (_ time: TimeTuple) -> Int {
    return (time.0 * 60 + time.1) * 60 + time.2
}

timeIntoSeconds(time)
//:  2.7 Опишите функцию обратную функции из предыдущего задания, принимающую 1 аргумент - количество секунд(например 1500) и конвертирует полученное время в формат кортежа (часы, минуты, секунды) из пункта 2.5
func secondsIntoTime (_ timeInSeconds: Int) -> TimeTuple {
    let hours = timeInSeconds / 3600
    let minutes = timeInSeconds % 3600 / 60
    let seconds = timeInSeconds % 60
    
    return (hours, minutes, seconds)
}
secondsIntoTime(48191)
//:  2.8 Объявите переменную которая будет иметь тип Closure(замыкание), которое принимает аргументы Int и String и возвращает массив String. Присвойте ей реализацию, которая повторит в массиве строку n раз. Выполните эту функцию, передав ей число 7 и строку "test".
let test: (Int, String) -> [String]

func printTest(number: Int, string: String) -> [String] {
    return Array(repeating: string, count: number)
}

test = printTest
let testArray = test(7, "test")
//:  2.9 Используя функцию `filter', получите массив только с городами с населением более 15 млн человек

struct City: CustomStringConvertible {
    
    let population: Int
    let country: String
    let name: String
    
    var description: String {
        return "\(population) \(country) \(name)"
    }
}

let citiesArray = [City(population: 24_256_800, country: "Китай", name: "Шанхай"),
City(population: 23_500_000, country: "Пакистан", name: "Карачи" ),
City(population: 21_516_000, country: "Пекин", name: "Китай"),
City(population: 16_349_831, country: "Индия", name: "Дели"),
City(population: 16_060_303, country: "Нигерия", name: "Лагос"),
City(population: 15_200_000, country: "Китай", name: "Тяньцзинь"),
City(population: 14_160_467, country: "Турция", name: "Стамбул"),
City(population: 13_513_734, country: "Япония", name: "Токио"),
City(population: 13_080_500, country: "Китай", name: "Гуанчжоу"),
City(population: 12_442_373, country: "Индия", name: "Мумбаи"),
City(population: 12_197_596, country: "Россия", name: "москва"),
City(population: 11_895_893, country: "Бразилия", name: "Сан-Паулу"),
City(population: 10_467_400, country: "Китай", name: "Шэньчжэнь"),
City(population: 10_075_310, country: "Индонезия", name: "Джакарта"),
City(population: 10_052_000, country: "Пакистан", name: "Лахор"),]

let newCitiesArray = citiesArray.filter({$0.population > 15_000_000})
print(newCitiesArray)
//: # 3. (5 баллов за каждый пункт)
//: ### Представьте себе задачу по разработке приложения для домашней климатической техники. В рамках данной задачи вам необходимо выполнить следующее:
/*:
 3.1 Опишите базовый класс HomeSensor, который содержит несколько общих свойств для разных датчиков (например: датчик влажности, температуры, CO2):
 - значение измеряемого параметра данным датчиком value,
 - название измеряемого параметра,
 - целевое значение параметра - идальный показатель (targetValue),
 - точность в процентах (погрешность датчика),
 - id датчика
 - Опишите Void(Ничего не возвращающую) функцию "output" с пустым телом (т.е. что бы она ничего не делала)

 3.2 Опишите наследуемые классы для каждого типа датчиков (HumiditySensor, TemperatureSensor, COSensor)
 3.3 В дочерних классах переопределите функцию Output, что бы она выводила описание типа "Температура на датчике 13 равна 15ºС +/- 1ºС. Целевое значение - 19ºС"

 3.4 Опишите класс для комнаты(Room), который может содержать несколько сенсоров(HomeSensor) в одном свойстве c названием sensors. Так же Room должно содержать свойство - название комнаты.
 3.5 Опишите класс Home, который может содержать несколько комнат(Room) в одном свойстве c названием rooms, а также опишите в нем функцию, которая выводит в консоль показания всех датчиков в каждой комнате, используя метод output
 */
class HomeSensor: CustomStringConvertible {
    private var currentValue: Double
    private var parameterName: String
    private var parameterUnits: String
    private var targetValue: Double
    private var sensorError: Double
    private var id: Int

    init(_ currentValue: Double, _ parameterName: String, _ parameterUnits: String, _ targetValue: Double, _ sensorError: Double, _ id: Int){
        self.currentValue = currentValue
        self.parameterName = parameterName
        self.parameterUnits = parameterUnits
        self.targetValue = targetValue
        self.sensorError = sensorError
        self.id = id
    }

    var description: String {
        return ("\(parameterName) on sensor \(id) is \(currentValue) \(parameterUnits) +/- \(sensorError) \(parameterUnits). Target value - \(targetValue) \(parameterUnits)")
    }
}

class TemperatureSensor: HomeSensor {
    var newTargetValue: Double = 0.0 { willSet(newValue){
        if newValue < 15.0 {
            print("The temperature is quite cold!")
        }
        }}
    init(_ currentValue: Double, _ targetValue: Double, _ sensorError: Double, _ id: Int) {
        self.newTargetValue = targetValue
        super.init(currentValue, "Temperature", "ºС", self.newTargetValue, sensorError, id)
    }
}

class HumiditySensor: HomeSensor {

    init(_ currentValue: Double, _ targetValue: Double, _ sensorError: Double, _ id: Int) {
        super.init(currentValue, "Humidity", "g/m^3", targetValue, sensorError, id)
    }
}

class COSensor: HomeSensor {

    init(_ currentValue: Double, _ targetValue: Double, _ sensorError: Double, _ id: Int) {
        super.init(currentValue, "CO", "ppmv", targetValue, sensorError, id)
    }
}

class Room {
    var sensors = [HomeSensor]()
    var roomName: String
    
    init (_ roomName: String) {
        self.roomName = roomName
    }
}

class Home {
    var rooms = [Room]()
    
    func output() {
        for i in rooms {
            for j in i.sensors {
                print(j.description)
            }
        }
    }
}
/*:
 Продемонстрируйте работу:
 - Создайте 1 экземпляр класса Home и  3 экземпляра Room (кухня, гостинная, спальня). Добавьте созданные экземпляры комнат в объект Home (в проперти rooms объекта Home)
 - Создайте и добавьте несколько экземпляров датчиков в каждую комнату
 - У объекта Home вызовите функцию, которая выводит в консоль показания всех датчиков в каждой комнате
 */
let home = Home()
let kitchen = Room("Kitchen")
let lounge = Room("Lounge")
let bedroom = Room("Bedroom")
home.rooms.append(contentsOf: [kitchen, lounge, bedroom])

let kitchenCOSensor = COSensor(1.5, 2, 0.01, 2)
let kitchenCOSensor2 = COSensor(1.4, 2.1, 0.02, 12)
let kitchenTemperatureSensor = TemperatureSensor(14, 24, 0.05, 4)
let kitchenHumiditySensor = HumiditySensor(0.06, 0.08, 0.001, 7)
kitchen.sensors.append(contentsOf: [kitchenCOSensor, kitchenCOSensor2, kitchenTemperatureSensor, kitchenHumiditySensor])

let loungeCOSensor = COSensor(1.3, 2.05, 0.025, 17)
let loungeTemperatureSensor = TemperatureSensor(20, 21, 0.04, 11)
let loungeTemperatureSensor2 = TemperatureSensor(18, 21, 0.04, 13)
let loungeHumiditySensor = HumiditySensor(0.067, 0.07, 0.001, 8)
lounge.sensors.append(contentsOf: [loungeCOSensor, loungeTemperatureSensor, loungeTemperatureSensor2, loungeHumiditySensor])

let bedroomCOSensor = COSensor(1.6, 2.2, 0.027, 77)
let bedroomTemperatureSensor = TemperatureSensor(22, 24, 0.05, 78)
let bedroomHumiditySensor = HumiditySensor(0.061, 0.08, 0.001, 79)
let bedroomHumiditySensor2 = HumiditySensor(0.054, 0.079, 0.001, 80)
bedroom.sensors.append(contentsOf: [bedroomCOSensor, bedroomTemperatureSensor, bedroomHumiditySensor, bedroomHumiditySensor2])

home.output()
//: Дополнительное задание:
/*:
 Для каждого датчика:
 - опишите дополнительное значение нижнего предела targetValueMin
 - опишите метод, устанавливающий targetValueMin и targetValueMax, предусмотрите валидацию введенного значения (что бы с точки зрения контекста каждого измерения не нарушалась логика)
 - в didSet проперти value предусмотрите сообщение в консоль в случае если новое значение больше, чем targetValue
 */
