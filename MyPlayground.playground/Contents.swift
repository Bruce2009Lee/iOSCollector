import UIKit

//struct Person {
//    var name: String
//
//    mutating func makeAnonymous() {
//        self.name = "Anonymous"
//    }
//}
//
//var person = Person(name: "Ed")
//person.makeAnonymous()
////print(person.name)

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

//extension Collection {
//    func summarize() {
//        print("There are \(count) of us:")
//
//        for name in self {
//            print(name)
//        }
//    }
//}


//
//var score :Int = 3
//var rate = score/5 * 100
//
//
//class SurveyQuestion {
//    let text: String
//
//    var response: String?
//
//      // 给常量存储属性赋值
//    init(text: String) {
//        self.text = text
//    }
//
//    func ask() {
//        print(text)
//    }


// 1.定义类
class Person {
    var name : String
    var dog : Dog?

    init(name : String) {
        self.name = name
    }
}

class Dog {
    var color : String
    var toy : Toy?

    init(color : String) {
        self.color = color
    }

    func runing() {
//        print("跑起来")
    }
}

class Toy {
    var price : Double = 0.0
}

let person = Person(name: "小明")
let dog = Dog(color: "yellow")
let toy = Toy()
toy.price = 100.0

// 2.2.设置对象之间的关系
person.dog = dog
dog.toy = toy

let price = person.dog?.toy?.price
//print(price) // Optional(100.0)\n

person.dog?.toy = Toy()
person.dog?.runing()


protocol FullyNamed {
    var fullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print("name : \(ncc1701.fullName)")
print("name : \(ncc1701.name)")
