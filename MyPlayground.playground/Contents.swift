import UIKit

struct Person {
    var name: String

    mutating func makeAnonymous() {
        self.name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
//print(person.name)

struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
//print(london.collectTaxes())

var toys = ["Woody"]


class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
//print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"
//print(singer.name)


let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()
