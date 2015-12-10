//: ## New in Swift 2
//:highlight the most exciting changes
//:so someone who is interested in the issue can be prepared for the great migration to Swift

//: ## Error Handling
//:the new system looks similar to exception handling
//:

// 1:Create an enum that derives from ErrorType
enum DrinkError: ErrorType {
    case NoBeerRemainingError
}
class Beer {
    func isAvailable() -> Bool {
        return true
    }
}
var beer = Beer()
// 2:Use the throws keyword to mark the function which can throw an error
func drinkWithError() throws {
    if beer.isAvailable() {
        // party!
    } else {
        // 3:throw an error
        throw DrinkError.NoBeerRemainingError
    }
}
func tryToDrink() {
    // 4:wrap any code that can throw an error in do block, 
    //than add the try keyword to each function call that could throw an error
    do {
        try drinkWithError()
    } catch {
        print("Could not drink beer! :[")
        return
    }
}
tryToDrink()
