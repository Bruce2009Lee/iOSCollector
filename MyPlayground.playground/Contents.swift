import UIKit

// 该函数返回一个闭包；闭包将捕获travel中的变量
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

// 函数的调用
let result = travel()
result("London")
result("London")
result("London")

