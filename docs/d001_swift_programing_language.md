# [Swift programing language](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)

What
- A programing language support frameworks: iOS, macOS, watchOS, tvOS

How
- Data type: Int, Double, Float, Bool, String
- Collection data type: Array, Set, Dictionary
- Support: Variable, Constant, Tuples(Group of values), Optionals(There is/is'nt a value)
```Swift
let PI:Double = 3.14, CAT:Int = 0 //Constant
var favoriteColor = "Red", anotherColor = "Green" //Variable
var length, height, width: Int //Variable
```
- Swift is type safe: Type system check and Null check


Print and comment: 
``` Swift
print("The current value of friendlyWelcome is \(friendlyWelcome)") // This is a comment
/*Multi
lines 
comment
*/
```

Type Aliases

```swift
typealias NhaInt = Uint16
```

Tuples(Group of values)
```Swift
let response = (200, "Ok") //Tuples
let (statusCode, statusMessage) = response
print("The status code is \(statusCode)")
print("The status code is \(response.0)")
let http200Status = (statusCode: 200, description: "OK") //Tuples with init elements name
```

Optional and nil
```swift
var answer: String? = "Yes" // Optional String which has or has not contains a value
answer = nil //Contain no value

```

Conversion
```Swift
let possibleNumber = "1213"
let convertedNumber = Int(possibleNumber) // convertedNumber is optional
```

Conditional statements
```swift
if convertedNumber != nil {
    print("convertedNumber values is \(convertedValue!))
}

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
```

Error handling
``` swift
func canThrowAnError() throws { //  A error-throwable func
}

do { //Handle error
    try canThrowAnError()
} catch {

}
```

Assertions and Preconditions

```swift
precondition(index > 0, "Index must be greater than zero.")

let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
```

