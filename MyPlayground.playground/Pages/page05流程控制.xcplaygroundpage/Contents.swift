/**
 if后面的条件可以省略小括号
 条件后面的大括号不可以省略
 if后面的条件只能是bool类型
 */

/**
 swift3开始，去除了自增（++）、自减（--）运算符
 */

//let names = ["aa","bb","cc","dd"]

//for i in 0...3 {
//    print(names[i])
//}
//
//let range = 1...3
//for i in range {
//    print(names[i])
//}

//let a = 1
//let b = 2
//for i in a...b {
//    print(names[i])
//}
//
//for i in a...3 {
//    print(names[i])
//}

//for var i in 1...3 {
//    i += 5
//    print(i)
//}
//
//for _ in 1...3 {
//    print("for")
//}

//for i in 1..<5 {
//    print(i)
//}

//for name in names[0...3] {
//    print(name)
//}

//for name in names[1...] {
//    print(name)
//}
//
//for name in names[...2] {
//    print(name)
//}
//
//for name in names[..<2] {
//    print(name)
//}

//let range = ...5
//range.contains(7)
//range.contains(3)
//range.contains(-3)
//
//let str = "a"
//let a: Character = "a"
//let z: Character = "z"
//let crange = a...z
//
//let hours = 11
//let hourInt = 2
//for tickMark in stride(from: 4, to: hours, by: hourInt) {
//    print(tickMark)
//}


//var num = 1

//switch必须要保证能处理所有情况
//switch num {
//case 1:
//    print("\(num)")
//case 2:
//    print("2")
//}

//case、default后面至少要有一条语句，如果不想做任何事，加个break即可
//switch num {
//case 1:
//    print("num is \(num)")
//    fallthrough
//default:
//    break
////    print("def num is \(num)")
//}
//
//enum Answer { case right, wrong}
//let answer = Answer.right
//switch answer {
//case Answer.right:
//    print("right")
//case Answer.wrong:
//    print("wrong")
//}
//
//switch answer {
//case .right:
//    print("right")
//case .wrong:
//    print("wrong")
//}

//let string = "Jack"
//switch string {
//case "Jack":
//    fallthrough
//case "Rose":
//    print("right person")
//default:
//    break
//}

//switch string {
//case "Jack", "Rose":
//    print("right person")
//default:
//    break
//}

//let char: Character = "a"
//switch char {
//case "a", "A":
//    print("char a")
//default:
//    print("not char a")
//}

//let count = 44
//switch count {
//case 0:
//    print("000")
//case 1..<5:
//    print("one")
//case 5..<12:
//    print("two")
//case 12..<100:
//    print("three")
//default:
//    print("def")
//}
//
//let point = (1,1)
//switch point {
//case (0,0):
//    print("one \(point)")
//case(_,0):
//    print("two \(point)")
//case (0,_):
//    print("three \(point)")
//case (-2...2, -2...2):
//    print("four \(point)")
//default:
//    print("def \(point)")
//}

//值绑定
//let point = (2,0)
//switch point {
//case (let x, 0):
//    print("x \(x)")
//case (0, let y):
//    print("y \(y)")
//case let (x, y):
//    print(("any \(x) \(y)"))
//}

//where
let point = (1, -1)
switch point {
case let (x, y) where x == y:
    print("x == y")
case let (x, y) where x == -y:
    print("x == -y")
case (_, _):
    print("some where")
}

var numbers = [10, 20, -10, -20, 30, -30]
var sum = 0
for num in numbers where num > 0 {//使用where来过滤num
    sum += num
}
print(sum)


