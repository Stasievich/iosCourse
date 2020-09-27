
//: # Задание:
// 1. Описать фцнкцию принимающую 2 аргумента String (word, line), которая с помощью цикла FOR считает сколько раз данное слово встречается в строке line

func findEntries (word: String, line: String) -> Int {
    var count = 0                                                                               //number of entries
    var position = 0                                                                            //position in line
    
    for char in line {
        guard position <= line.count - word.count else { return count }                         //oob check
        
        if word.first?.lowercased() == char.lowercased() {
            let firstChar = line.index(line.startIndex, offsetBy: position)
            let lastChar = line.index(line.startIndex, offsetBy: position + word.count - 1)
            let sub = line[firstChar...lastChar]                                                //substring in line
            
            if sub.lowercased() == word.lowercased() {
                count += 1
            }
        }
        
        position += 1
    }
    return count
}

findEntries(word: "bob", line: "Some Bob likes bobbing and tobobob")


// 2. Написать алгоритм с помощью цикла DO-WHILE который добавляет в массив [Int] элементы (можно одинаковые, можно рандомные) до тех пор, пока сумма элементов массива меньше 100

var sum = 0
var arraySum = [Int]()
var randomElement = 0

repeat {
    randomElement = Int.random(in: 0...15)
    sum += randomElement
    if sum >= 100 {
        break
    }
    
    arraySum.append(randomElement)
}
while true

print(arraySum)


// 3. Написать 1 алгоритм сортировки элементов массива [Int]

//Merge Sort

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middle = array.count / 2
    let firstPart = mergeSort(Array(array[0..<middle]))
    let secondPart = mergeSort(Array(array[middle..<array.count]))
    
    return mergeParts(firstPart, secondPart)
}

func mergeParts(_ firstPart: [Int], _ secondPart: [Int]) -> [Int] {
    var firstPartIndex = 0
    var secondPartIndex = 0
    
    var sortedArray = [Int]()
    
    while firstPartIndex < firstPart.count && secondPartIndex < secondPart.count {
        if firstPart[firstPartIndex] < secondPart[secondPartIndex]{
            sortedArray.append(firstPart[firstPartIndex])
            firstPartIndex += 1
        }
        else if secondPart[secondPartIndex] < firstPart[firstPartIndex]{
            sortedArray.append(secondPart[secondPartIndex])
            secondPartIndex += 1
        }
        else {
            sortedArray.append(firstPart[firstPartIndex])
            sortedArray.append(secondPart[secondPartIndex])
            firstPartIndex += 1
            secondPartIndex += 1
        }
    }
    
    while firstPartIndex < firstPart.count {
        sortedArray.append(firstPart[firstPartIndex])
        firstPartIndex += 1
    }
    
    while secondPartIndex < secondPart.count {
        sortedArray.append(secondPart[secondPartIndex])
        secondPartIndex += 1
    }
    
    return sortedArray
}

print(mergeSort(arraySum))
