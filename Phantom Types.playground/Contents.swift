import UIKit


struct Named<T>: Hashable, ExpressibleByStringLiteral, CustomStringConvertible {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    init(stringLiteral value: String) {
        self.name = value
    }
    
    var description: String {
        return name
    }
}

enum CountryTag {}
enum Capitaltag {}

// Phantom types in swift

typealias country = Named<CountryTag>
typealias capital = Named<Capitaltag>

var lookUp: [country: capital] = ["India": "Delhi",
                                "England": "London"]


func printStateAndCapital(_ country: country, capital: capital) {
    print("the capital of \(country) is \(capital)")
}

func test() {
    let india = country("India")
    guard let cap = lookUp[india] else {
        return
    }
    printStateAndCapital(india, capital: cap)
}

test()
