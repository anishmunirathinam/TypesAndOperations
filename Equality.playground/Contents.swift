import UIKit

struct Email: Equatable {
    private(set) var address: String
    
    init?(_ raw: String) {
        guard raw.contains("@") else {
            fatalError("Not a valid Email")
        }
        address = raw
    }
}

class User: Equatable {
    var id: Int?
    var name: String
    var email: Email
    
    init(id: Int?, name: String, email: Email) {
        self.id = id
        self.name = name
        self.email = email
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.email == rhs.email
    }
}

guard let email = Email("anish@example.com") else {
    fatalError("Not a valid email")
}

let user1 = User(id: nil, name: "anish", email: email)
let user2 = User(id: nil, name: "anish", email: email)

// checking if user1 values are equal to user 2
user1 == user2
// checking if user1 and user2 reference to same object in memory
user1 === user2


let user3 = user1
user1 === user3
