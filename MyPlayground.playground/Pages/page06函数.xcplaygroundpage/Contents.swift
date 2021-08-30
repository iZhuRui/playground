//func pi() -> Double {
//    return 3.14
//}
//print(pi())
//
//func sum(v1:Int, v2:Int) -> Int {
//    return v1 + v2
//}
//
//print(sum(v1: 10, v2: 30))

//func hello() -> Void{
//    print("hello")
//}
//
//func hello() -> () {
//    print("hello")
//}

//func hello() {
//    print("hello")
//}
//
//hello()

//如果整个函数体是一个单一表达式，那么函数会隐式返回这个表达式
//func sum(v1:Int, v2:Int) -> Int {
//    v1 + v2
//}
//sum(v1: 30, v2: 20)

//返回元组：实现多返回值
//func calculate(v1:Int, v2:Int) -> (sum:Int, difference:Int, average:Int) {
//    let sum = v1 + v2
//    return (sum, v1 - v2, sum >> 1)
//}
//
//let result = calculate(v1: 40, v2: 30)
//result.sum
//result.difference
//result.average


//函数文档注释
/// 求和【概述】
///
/// 将2个整数相加【更详细的描述】
///
/// - Parameter v1:第一个整数
/// - Parameter v2:第二个参数
/// - Returns:两个整数的和
///
/// - Note:传入两个整数即可【批注】
///
//func sum(v1:Int, v2:Int) -> Int {
//    v1 + v2
//}


//func goToWork (at time: String) {
//    print("time is \(time)")
//}
//
//goToWork(at: "09:00")
//
//func sumFunc(_ v1:Int, _ v2:Int) {
//    v1 + v2
//}
//
//sumFunc(30, 20)


/**
 默认参数值
 参数可以有默认值
 func check(name: String = "someone", age: Int, job: String = "none") {
     print("name=\(name), age=\(age), job=\(job)")
 }

 check(name: "jack", age: 19, job: "coder")
 check(name: "rose", age: 18)
 check(age: 17, job: "fireman")
 check(age: 16)
 //C++的默认参数值有个限制：必须从右往左设置，由于swift拥有参数标签，因此并没有此类限制
 //但是在省略参数标签时，需要特别注意，避免出错
 
 
 //这里的middle不可以省略参数标签
 //由于三个参数都可以省略标签，传参的时候都可不用写标签
 func test (_ first:Int = 10, _ middle:Int, _ last:Int = 30){
     print("ffff")
 }
 //三个参数都没有标签，不是把30传给没有默认值的middle，而是会按顺序传参，会导致middle没有值，报错
 test(30)
 //要保证调用的时候每个参数都有值
 */


/**
 //可变参数
 //一个函数最多只能有一个可变参数
 func sum(_ numbers:Int...) -> Int {
     var total = 0
     for number in numbers {
         total += number
     }
     return total
 }

 sum(10, 20, 30)

 //紧跟在可变参数后面的参数不能省略参数标签，参数string不能省略标签，如果用省略标签，会造成可变参数和后面一个参数的歧义
 func test (_ numbers:Int..., string:String, _ other:String) {
     print(numbers)
     print(string);
     print(other)
 }
 test(20,30,40, string: "aa", "bb")
 */

/**
 自带print
 print("1","2","3")
 print("1","2","3", separator: "z", terminator: "\n")
 */

/**
 输入输出参数（In-Out Parameter）
 可以用inout定义一个输入输出参数：可以在函数内部修改外部实参的值
 
 */
var number = 10
func add(_ num: inout Int){
    num += 10
}
add(&number)
print(number)

//func swapValues (_ v1:inout Int, _ v2:inout Int){
//    let tmp = v1
//    v1 = v2
//    v2 = tmp
//}
func swapValues (_ v1: inout Int, _ v2: inout Int) {
    (v1, v2) = (v2, v1)
}
var num1 = 20
var num2 = 40
swapValues(&num1, &num2)
print("\(num1),\(num2)")

//函数重载
/**
 规则
 1.函数名相同
 2.参数个数不同、参数类型不同、参数标签不同
 
 
 func sum(v1:Int, v2:Int) {
     v1+v2
 }

 func sum(v1:Int, v2:Int, v3:Int) {
     v1+v2+v3
 }//参数个数不同

 func sum(v1:Int, v2:Double) -> Double {
     Double(v1) + v2
 }//参数类型不同

 func sum(_ v1:Int, _ v2:Int) -> Int{
     v1+v2
 }//参数标签不同，调用的时候是没有标签的

 func sum(a:Int, b:Int) -> Int {
     a+b
 }//参数标签不同
 */


/**
 函数重载注意点
 1.返回值类型与函数重载无关
 func sum(v1: Int, v2: Int) -> Int {v1 + v2}
 func sum(v1: Int, v2: Int) { }
 sum(v1: 10, v2: 30)
 
 
 2.默认参数值和函数重载一起使用产生二义性时，编译器并不会报错（C++中会报错）
 func sum(v1: Int, v2: Int) -> Int {
     v1 + v2
 }
 func sum(v1: Int, v2: Int, v3: Int = 10) -> Int {
     v1 + v2 + v3
 }
 // 会调用sum(v1: Int, v2: Int)
 sum(v1: 10, v2: 40)
 
 
 
 
 3.可变参数、省略参数标签、函数重载一起使用产生二义性时，编译器有可能会报错
 
 */




//函数类型
func sumTest(a:Int, b:Int) -> Int{
    a+b
}
var fn:(Int, Int) -> Int = sumTest
fn(2,4)//6,调用时不需要参数标签

func next(_ input:Int) -> Int {
    input + 1
}

func previous(_ input:Int) -> Int {
    input - 1
}

func forward(_ forward:Bool) -> (Int) -> Int {
    forward ? next : previous
}
forward(true)(3)
forward(false)(3)

//类型起别名
typealias Date = (year:Int,month:Int,day:Int)
func dateTest(_ date:Date) {
    print(date)
}
dateTest((2020,9,17))

dateTest((2020,2,14))
