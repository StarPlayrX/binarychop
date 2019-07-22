//This file contains three examples

//solution 1
public class binary {
    
    func chop(int: Int,
              arrayInt: Array<Int>) -> Int {
        
        if ( arrayInt.count == 0 ) {
            return -1
        }
        
        
        var min = 0;
        var max = arrayInt.count - 1
        
        var slice = max / 2
        
        while int != arrayInt[slice] {
            
            if int < arrayInt[slice] {
                max = slice - 1
            } else {
                min = slice + 1
            }
            
            slice = min + (max - min) / 2
            
            if max < min || min > slice {
                return -1
            }
        }
        
        
        return slice
        
    }
}

//slice array in sections
extension Array {
    func section(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

//solution 2
public class binarySwift {
    
    func chop(int: Int,arrayInt: Array<Int>) -> Int {
        
        var low = [Int]()
        var high = [Int]()
        
        let split = arrayInt.section(into: arrayInt.count / 2)
        
        if let a1 = split.first {
            low = a1
        }
        
        if let b2 = split.last {
            high = b2
        }
        
        var useLow = false
        
        if let check4low = low.last {
            if ( int <= check4low  ) {
                useLow = true
            }
        }
       
        print("useLow:" + String(useLow))

        if (useLow) {
            for i in low {
                if i == int {
                    return i
                }
            }
        } else {
            for i in high {
                if i == int {
                    return i
                }
            }
        }
        

        return -1
    }
}

//solution 3
public class binarySwiftB {
    
    func chop(int: Int,arrayInt: Array<Int>) -> Int {
        
        let slice = numbers.count / 2

        let low: ArraySlice<Int> = arrayInt[0 ..< slice]
        let high: ArraySlice<Int> = arrayInt[slice ..< arrayInt.count ]
        
        var useLow = false
        
        if let check4low = low.last {
            if ( int <= check4low  ) {
                useLow = true
            }
        }
        
        print("useLow:" + String(useLow))
        
        if (useLow) {
            for i in low {
                if i == int {
                    return i
                }
            }
        } else {
            for i in high {
                if i == int {
                    return i
                }
            }
        }
        
        return -1
    }
}

let numbers = Array(0...10)

let returndata3 = binarySwiftB().chop(int: 9, arrayInt: numbers)
print(returndata3)


//to do put this in binarySwift class


let returndata1 = binary().chop(int: 5,arrayInt: [5,4,3,2,1,0,6].sorted())
print(returndata1)

let returndata2 = binarySwift().chop(int: 2, arrayInt: numbers)
print(returndata2)



print("-------")
