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


//MemoryLayout
//可以使用MemoryLayout获取数据类型占用的内存大小
var age : Int = 10
//MemoryLayout<Int>.size
//MemoryLayout<Int>.stride
//MemoryLayout<Int>.alignment
MemoryLayout.size(ofValue: age)
MemoryLayout.stride(ofValue: age)
MemoryLayout.alignment(ofValue: age)

enum P_Pwd {
    case number(Int, Int, Int, Int)//4 * 8
    case other//1
    //other是1个字节，可以看作是为了和32字节的number做区分；other 1个字节，只是为了作区分，不用浪费空间分配2、3个字节
}//关联值，可传入不同的值，每一个单独的枚举变量，要有自己的内存去存储；传进去的值，直接存入枚举变量内存中
var p_pwd = P_Pwd.number(3, 8, 9, 8)
p_pwd = .other
MemoryLayout<P_Pwd>.size//33，实际用到的空间大小；32个字节拿来放case number(Int, Int, Int, Int),最后一个字节拿来放case other
MemoryLayout<P_Pwd>.stride//40，分配占用的空间大小，真正占用大小；分配的大小，要是alignment的倍数，是40
MemoryLayout<P_Pwd>.alignment//8，对齐参数

enum P_Season :Int {
    case spring = 909099999099,summer,autumn,winter
}//原始值，是固定死的，不允许之后传入不同的值，不会存储到枚举变量内存中；
MemoryLayout<P_Season>.size//1
MemoryLayout<P_Season>.stride//1
MemoryLayout<P_Season>.alignment//1

enum Season_1 {
    //类似于  0    1       2      3；用一个字节就能定义这个枚举变量
    case spring,summer,autumn,winter
}
var s = Season_1.spring
MemoryLayout<Season_1>.size//1
MemoryLayout<Season_1>.stride//1
MemoryLayout<Season_1>.alignment//1

enum Season_2 : String {
    //类似于存储的是0  1   2   3，要去实际值，用rawvalue
    case spring = "sp", summer = "su", autumn = "au", winter = "wi"
}
MemoryLayout<Season_2>.size//1
MemoryLayout<Season_2>.stride//1
MemoryLayout<Season_2>.alignment//1
var s2 = Season_2.spring//原始值不会存储到枚举变量内存中，关联值才会
s2.rawValue
