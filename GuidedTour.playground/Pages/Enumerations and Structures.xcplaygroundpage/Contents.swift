//: ## Enumerations and Structures
//:
//: Use `enum` to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
//:
enum Rank: String {
    case Ace = "One"
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack = "11"
    case Queen = "12"
    case King = "13"
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let ace = Rank.King
let aceRawValue = ace.rawValue
ace.simpleDescription()

func compareTwoRanks(rankOne:Rank, rankTwo:Rank) -> String {
    if rankOne.rawValue > rankTwo.rawValue {
        return "\(rankOne.simpleDescription()) is bigger than \(rankTwo.simpleDescription())"
    } else if rankOne.rawValue < rankTwo.rawValue {
        return "\(rankOne.simpleDescription()) is smaller than \(rankTwo.simpleDescription())"
    } else {
        return "\(rankOne.simpleDescription()) is equal to \(rankTwo.simpleDescription())"
    }
}
let rankOne = Rank.King
let rankTwo = Rank.Queen
print(rankOne)
print(rankTwo)
compareTwoRanks(rankOne, rankTwo: rankTwo)
var rankEnum = Rank.init(rawValue:"One")
rankEnum = Rank(rawValue: "12")

//: > **Experiment**:
//: > Write a function that compares two `Rank` values by comparing their raw values.
//:
//: In the example above, the raw-value type of the enumeration is `Int`, so you only have to specify the first raw value. The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration. Use the `rawValue` property to access the raw value of an enumeration case.
//:
//: Use the `init?(rawValue:)` initializer to make an instance of an enumeration from a raw value.
//:
if let convertedRank = Rank(rawValue: "One") {
    let threeDescription = convertedRank.simpleDescription()
}

//: The case values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
//:
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
    func color() -> String {
        switch self {
            case .Spades, .Clubs:
                return "black"
            case .Hearts, .Diamonds:
                return "red"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
print(hearts.color())

//: > **Experiment**:
//: > Add a `color()` method to `Suit` that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
//:
//: Notice the two ways that the `Hearts` case of the enumeration is referred to above: When assigning a value to the `hearts` constant, the enumeration case `Suit.Hearts` is referred to by its full name because the constant doesn’t have an explicit type specified. Inside the switch, the enumeration case is referred to by the abbreviated form `.Hearts` because the value of `self` is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known.
//:
//: Use `struct` to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
//:
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//: > **Experiment**:
//: > Add a method to `Card` that creates a full deck of cards, with one card of each combination of rank and suit.
//:
//: An instance of an enumeration case can have values associated with the instance. Instances of the same enumeration case can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration case is the same for all of its instances, and you provide the raw value when you define the enumeration.
//:
//: For example, consider the case of requesting the sunrise and sunset time from a server. The server either responds with the information or it responds with some error information.
//:
enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case Cancel(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")
let cancel = ServerResponse.Cancel("User canceled the action")

switch cancel {
    case let .Result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .Error(error):
        print("Failure...  \(error)")
    case let .Cancel(usercancel):
        print("\(cancel)")
}

//: > **Experiment**:
//: > Add a third case to `ServerResponse` and to the switch.
//:
//: Notice how the sunrise and sunset times are extracted from the `ServerResponse` value as part of matching the value against the switch cases.
//:


//: [Previous](@previous) | [Next](@next)
