import UIKit

struct Email: Hashable {
    private(set) var address: String
    
    init?(_ raw: String) {
        guard raw.contains("@") else {
            fatalError("Not a valid Email")
        }
        address = raw
    }
}

class User: Hashable {
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(email)
    }
}

guard let email = Email("anish@example") else {
    fatalError("Not a valid Email")
}

let user = User(id: 12, name: "Anish", email: email)
let anotherUser = User(id: 12, name: "Ray", email: email)

user.hashValue
anotherUser.hashValue
user.id?.hashValue
user.email.hashValue
anotherUser.id?.hashValue

