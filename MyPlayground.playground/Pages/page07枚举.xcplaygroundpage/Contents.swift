//枚举
enum Direction {
    case north
    case south
    case west
    case east
}

//enum Direction {
//    case north, south, west, east
//}

var dir = Direction.west
dir = Direction.east
dir = .north
print(dir)

switch dir {
case .east:
    print("\(dir)")
case .west:
    print("\(dir)")
case .south:
    print("\(dir)")
case .north:
    print("\(dir)")
}

//关联值
//有时会将枚举的成员值跟其他类型的关联存储在一起
enum Score {
    case points(Int)
    case grade(Character)
}
var score = Score.points(98)
score = .grade("A")
switch score {
case let .points(i):
    print(i, "points")
case let .grade(i):
    print("grade", i)
}

enum Date {
    case digit(year: Int, month: Int, day: Int)
    case string(String)
}
var date = Date.digit(year: 2021, month: 8, day: 9)
//date = .string("2021-8-10")
switch date {
//case .digit(year: let year, month: let month, day: let day):
//    print(year, month, day)

case var .digit(year, month, day):
    print(year, month, day)

//case let .string(value):
//    print(value)
    
case var .string(value):
    print(value)
}


//举例：开机密码
enum Password {
    case number(Int, Int, Int, Int)
    case gesture(String)
}
var pwd = Password.number(3, 5, 7, 9)
pwd = .gesture("12369")
switch pwd {
case let .number(n1, n2, n3, n4):
    print("number is ", n1,n2,n3,n4)
case let .gesture(str):
    print("gesture is ",str)
}

//原始值
//枚举成员可以使用相同类型的默认值预先关联，这个默认值叫做：原始值
enum PokeSuit : Character {
    case spade = "♠"
    case heart = "♥"
    case diamond = "♦"
    case club = "♣"
}
var suit = PokeSuit.spade
print(suit)
print(suit.rawValue)
print(PokeSuit.heart.rawValue)

enum Grade : String {
    case perfect = "A"
    case great = "B"
    case good = "C"
    case bad = "D"
}
print(Grade.perfect.rawValue)
print(Grade.great.rawValue)
print(Grade.good.rawValue)
print(Grade.bad.rawValue)


//隐式原始值
//如果枚举的原始值类型是Int、String，swift会自动分配原始值
enum Direction_1 : String {
    case north = "north"
    case south = "south"
    case east = "east"
    case west = "west"
}
//等价于
enum Direction_2 : String {
    case north, south, east, west
}
print(Direction_1.north)
print(Direction_2.north.rawValue)

//enum Season : Int {
//    case spring, summer, autumn, winter
//}
enum Season : Int {
    case spring = 1, summer, autumn = 4, winter
}
print(Season.spring.rawValue)
print(Season.summer.rawValue)
print(Season.autumn.rawValue)
print(Season.winter.rawValue)


//递归枚举
indirect enum ArithExpr {
    case number(Int)
    case sum(ArithExpr, ArithExpr)
    case difference(ArithExpr, ArithExpr)
}
//也可以下
//enum ArithExpr {
//    case number(Int)
//    indirect case sum(ArithExpr, ArithExpr)
//    indirect case difference(ArithExpr, ArithExpr)
//}

let five = ArithExpr.number(5)
let four = ArithExpr.number(4)
let two = ArithExpr.number(2)
let sum = ArithExpr.sum(five, four)
let difference = ArithExpr.difference(sum, two)

func calculate (_ expr: ArithExpr) -> Int {
    switch expr {
    case let .number(value):
        return value
    case let .sum(left, right):
        return calculate(left) + calculate(right)
    case let .difference(left, right):
        return calculate(left) - calculate(right)
    }
}
calculate(difference)
