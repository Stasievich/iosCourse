import UIKit
import GSS
import CoreGraphics
import SwiftUI


// Intersection between two rectangles in the case where their sides parallel to axises

var rectangle1 = CGRect(x: 1.0, y: 2.0, width: 6.0, height: 8.0)
var rectangle2 = CGRect(x: 3, y: 4, width: 4, height: 10)

rectangle2.intersects(rectangle1)
rectangle2.intersection(rectangle1)

// Intersection between two rectangles in common case using cartesian coordinate system

struct Point {
    var x: Double
    var y: Double
}

struct Rectangle {
    var rectangle: [Point]
}

func intersect (firstRectangle: Rectangle, secondRectangle: Rectangle) -> Bool {
    for i in 0...1 {
        var notIntersectSide: [Bool] = []
        for j in 0...3 {
            let point = getPointOnLine(firstPoint: firstRectangle.rectangle[i], secondPoint: firstRectangle.rectangle[i+1], pointToProect: secondRectangle.rectangle[j])
            pointInRange(firstBound: firstRectangle.rectangle[i], secondBound: firstRectangle.rectangle[i+1], point: point, notIntersectSide: &notIntersectSide)
        }
        
        print(notIntersectSide)
        if notIntersectSide.count == 4 && notIntersectSide.allSatisfy({ $0 == notIntersectSide[0] }) {
            return false
        }
    }
    
    return true
}

func pointInRange (firstBound: Point, secondBound: Point, point: Point, notIntersectSide: inout [Bool]){
    let minX = min(firstBound.x, secondBound.x)
    let maxX = max(firstBound.x, secondBound.x)
    let minY = min(firstBound.y, secondBound.y)
    let maxY = max(firstBound.y, secondBound.y)
    
    if point.x == minX {
        if point.y < minY {
            notIntersectSide.append(false)
        }
        else if point.y > maxY {
            notIntersectSide.append(true)
        }
    }
    else if point.x < minX {
        notIntersectSide.append(false)
    }
    else if point.x > maxX {
        notIntersectSide.append(true)
    }
}

func getPointOnLine (firstPoint: Point, secondPoint: Point, pointToProect: Point) -> Point {
    var x: Double = 0
    var y: Double = 0
    if secondPoint.x == firstPoint.x {
        x = secondPoint.x
        y = pointToProect.y
    }
    else if secondPoint.y == firstPoint.y {
        x = pointToProect.x
        y = secondPoint.y
    }
    else {
        let coeff = (secondPoint.y - firstPoint.y) / (secondPoint.x - firstPoint.x)
        let angleCoeff = -1 / coeff
        
        x = (firstPoint.x * coeff - firstPoint.y - angleCoeff * pointToProect.x + pointToProect.y) / (coeff - angleCoeff)
        y = (x - firstPoint.x) * coeff + firstPoint.y
    }
    
    return Point(x: x, y: y)
}

func intersectOrNot (firstRectangle: Rectangle, secondRectangle: Rectangle) {
    if intersect(firstRectangle: firstRectangle, secondRectangle: secondRectangle) && intersect(firstRectangle: secondRectangle, secondRectangle: firstRectangle) {
        print("Given rectangles intersect!")
    }
    else {
        print("Given rectangles don't intersect!")
    }
}



var experimental1 = Rectangle(rectangle: [Point(x: 2, y: 7), Point(x: 5, y: 10), Point(x: 10, y: 5), Point(x: 7, y: 2)])
var experimental2 = Rectangle(rectangle: [Point(x: 12, y: 3), Point(x: 12, y: 7), Point(x: 17, y: 7), Point(x: 17, y: 3)])
//var experimental2 = Rectangle(rectangle: [Point(x: 9, y: 2.5), Point(x: 9, y: 4), Point(x: 10, y: 4), Point(x: 10, y: 2.5)])
intersectOrNot(firstRectangle: experimental1, secondRectangle: experimental2)



// Implementing Quick Sort cause i did Merge Sort last time

func quickSort (array: inout [Int], left: Int, right: Int) {
    if left < right {
        let pivot = part(array: &array, left: left, right: right)
        quickSort(array: &array, left: left, right: pivot-1)
        quickSort(array: &array, left: pivot+1, right: right)
    }
}

func part(array: inout [Int], left: Int, right: Int) -> Int {
    let pivot = array[right]
    var i = left - 1
    
    for j in left...right-1 {
        if array[j] <= pivot{
            i += 1
            array.swapAt(i, j)
        }
    }
    array.swapAt(i+1, right)
    return i + 1
}

var array1 = [111,0,12,23,234,23,25,4537,58,769,789,6,53,2,1,0,111,44,88,45]
quickSort(array: &array1, left: 0, right: array1.count-1)
